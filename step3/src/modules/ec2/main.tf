resource "aws_instance" "this" {
  count = var.instance_count

  ami                     = "ami-0f8c5c464a21bed8b"
  instance_type           = "t3.micro"
  key_name                = "drych2-key"
  vpc_security_group_ids  = var.vpc_security_group_ids
  subnet_id               = element(var.subnet_ids, count.index)
  associate_public_ip_address = true

  tags = {
    Name                  = "${var.name}-step3-${count.index + 1}"
    Owner                 = "${var.name}-owner"
    CreatedBy             = var.name
    Purpose               = "step3"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo amazon-linux-extras install docker -y",
      "sudo systemctl start docker",
      "sudo systemctl enable docker"
    ]

    connection {
      type        = "ssh"
      user        = var.ansible_user
      private_key = file(var.private_key)
      host        = self.public_ip
    }
  }
}
