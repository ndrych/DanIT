output "instances" {
  description = "List of instance IDs"
  value       = aws_instance.this[*].id
}

output "public_ips" {
  description = "List of public IP addresses"
  value       = aws_instance.this[*].public_ip
}
