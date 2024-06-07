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

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "instance_ids" {
  description = "The IDs of the instances"
  value       = module.ec2.instance_ids
}

output "instance_public_ips" {
  description = "The public IPs of the instances"
  value       = module.ec2.public_ips
}

output "inventory" {
  value = templatefile("inventory.tpl", {
    public_ips       = module.ec2.public_ips
    ansible_user     = var.ansible_user
    ansible_port     = var.ansible_port
    private_key      = var.private_key
    prometheus_port  = var.prometheus_port
    grafana_port     = var.grafana_port
    node_exporter_port = var.node_exporter_port
    cadvisor_port    = var.cadvisor_port
  })
}
