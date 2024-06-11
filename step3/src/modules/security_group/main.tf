resource "aws_security_group" "this" {
  name        = "${var.name}-sg"
  description = "Security group for step3 project"
  vpc_id      = var.vpc_id

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

  tags = {
    Name       = "${var.name}-sg"
    Owner      = "${var.name}-owner"
    CreatedBy  = var.name
    Purpose    = "step3"
  }
}
