resource "aws_vpc" "drych_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "drych-vpc"
  }
}

resource "aws_subnet" "drych_subnet" {
  vpc_id            = aws_vpc.drych_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-north-1a"

  tags = {
    Name = "drych-subnet"
  }
}

resource "aws_internet_gateway" "drych_igw" {
  vpc_id = aws_vpc.drych_vpc.id

  tags = {
    Name = "drych-igw"
  }
}

resource "aws_route_table" "drych_route_table" {
  vpc_id = aws_vpc.drych_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.drych_igw.id
  }

  tags = {
    Name = "drych-route-table"
  }
}

resource "aws_route_table_association" "drych_association" {
  subnet_id      = aws_subnet.drych_subnet.id
  route_table_id = aws_route_table.drych_route_table.id
}
