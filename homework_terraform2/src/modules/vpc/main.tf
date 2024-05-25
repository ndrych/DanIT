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

resource "aws_subnet" "drych_private_subnet" {
  count = length(var.private_subnets_cidrs)

  vpc_id            = aws_vpc.drych_vpc.id
  cidr_block        = var.private_subnets_cidrs[count.index]
  map_public_ip_on_launch = false
  availability_zone = "eu-north-1a"

  tags = {
    Name = "${var.name}-private-${count.index}"
  }
}

resource "aws_internet_gateway" "drych_igw" {
  vpc_id = aws_vpc.drych_vpc.id
  
    tags = {
    Name = "${var.name}-igw"
  }
}

resource "aws_nat_gateway" "drych_nat" {
  allocation_id = aws_eip.drych_eip.id
  subnet_id     = aws_subnet.drych_public_subnet[0].id

  tags = {
    Name = "${var.name}-nat"
  }
}

resource "aws_eip" "drych_eip" {
  domain = "vpc"

  tags = {
    Name = "${var.name}-eip"
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

resource "aws_route_table" "drych_private_route_table" {
  vpc_id = aws_vpc.drych_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.drych_nat.id
  }

  tags = {
    Name = "${var.name}-private-rt"
  }
}
resource "aws_route_table_association" "drych_public_rt_association" {
  count = length(var.public_subnets_cidrs)

  subnet_id      = aws_subnet.drych_public_subnet[count.index].id
  route_table_id = aws_route_table.drych_public_route_table.id
}

resource "aws_route_table_association" "drych_private_rt_association" {
  count = length(var.private_subnets_cidrs)

  subnet_id      = aws_subnet.drych_private_subnet[count.index].id
  route_table_id = aws_route_table.drych_private_route_table.id
}
