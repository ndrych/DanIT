
output "instance_ip" {
  description = "The public IP address of the EC2 instance"
  value       = module.drych_ec2.instance_ip
}
