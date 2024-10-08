output "security_group_id" {
  description = "The ID of the security group"
  value       = module.security_group.security_group_id
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

output "instances" {
  description = "The IDs of the instances"
  value       = module.ec2.instances
}

output "instance_public_ips" {
  description = "The public IPs of the instances"
  value       = module.ec2.public_ips
}

