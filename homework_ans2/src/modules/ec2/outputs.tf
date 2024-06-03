output "public_instance_ip" {
  value = aws_instance.drych[*].public_ip
}

output "instances" {
  value = aws_instance.drych[*].id
}

