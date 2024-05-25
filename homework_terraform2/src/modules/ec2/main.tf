resource "aws_instance" "drych_public_instance" {
  ami           = "ami-0f8c5c464a21bed8b"
  instance_type = "t3.micro"
  subnet_id     = var.public_subnet_id
  vpc_security_group_ids = [var.security_group_id]
  associate_public_ip_address = true
  key_name      = "drych2-key"

  tags = {
    Name = "${var.name}-public"
  }
}

resource "aws_instance" "drych_private_instance" {
  ami           = "ami-0f8c5c464a21bed8b"
  instance_type = "t3.micro"
  subnet_id     = var.private_subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name      = "drych2-key"

  tags = {
    Name = "${var.name}-private"
  }
}
