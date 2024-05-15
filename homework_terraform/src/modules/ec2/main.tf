data "aws_ami" "al2" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
}

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
 }
}

resource "aws_instance" "drych_web" {
  ami           = data.aws_ami.al2.id
  instance_type = "t3.micro"
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  associate_public_ip_address = true
  key_name                    = "drych2-key"

  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                amazon-linux-extras install -y nginx1
                systemctl start nginx
                systemctl enable nginx
              EOF

  tags   = {
    name = "drych-web-server"
  }
}
