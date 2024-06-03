resource "aws_security_group" "drych_allow_ports" {
  vpc_id      = var.vpc_id
  description = "Allows access from any location to the specified ports"

  tags = {
    Name = "drych-open-ports"
  }

  dynamic "ingress" {
    for_each = toset(var.open_ports)

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

