output "vpc_id" {
  value = module.drych_vpc.vpc_id
}

output "public_subnets" {
  value = module.drych_vpc.public_subnets
}

output "private_subnets" {
  value = module.drych_vpc.private_subnets
}

output "public_instance_ip" {
  value = module.ec2.public_instance_ip
}

output "private_instance_ip" {
  value = module.ec2.private_instance_ip
}
