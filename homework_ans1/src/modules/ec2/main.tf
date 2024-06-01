resource "aws_instance" "drych" {
  count         = var.instance_count
  ami           = "ami-0f8c5c464a21bed8b"
  instance_type = "t3.micro"
  subnet_id = var.public_subnet_ids[count.index]
  vpc_security_group_ids = [var.security_group_id]
  associate_public_ip_address = true
  key_name      = "drych2-key"

  tags = {
    Name = "${var.name}-ans-${count.index + 1}"
  }
}
