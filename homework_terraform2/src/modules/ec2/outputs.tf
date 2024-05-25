output "private_instance_ip" {
  value = aws_instance.drych_private_instance.private_ip
}

output "public_instance_ip" {
  value = aws_instance.drych_public_instance.public_ip
}

