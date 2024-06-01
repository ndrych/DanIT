resource "aws_vpc" "drych_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.name
  }
}

resource "aws_subnet" "drych_public_subnet" {
  count = length(var.public_subnets_cidrs)

  vpc_id            = aws_vpc.drych_vpc.id
  cidr_block        = var.public_subnets_cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone = "eu-north-1a"

  tags = {
    Name = "${var.name}-public-${count.index}"
  }
}

resource "aws_internet_gateway" "drych_igw" {
  vpc_id = aws_vpc.drych_vpc.id
  
    tags = {
    Name = "${var.name}-igw"
  }
}

resource "aws_route_table" "drych_public_route_table" {
  vpc_id = aws_vpc.drych_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.drych_igw.id
  }

  tags = {
    Name = "${var.name}-public-rt"
  }
}

resource "aws_route_table_association" "drych_public_rt_association" {
  count = length(var.public_subnets_cidrs)

  subnet_id      = aws_subnet.drych_public_subnet[count.index].id
  route_table_id = aws_route_table.drych_public_route_table.id
}

