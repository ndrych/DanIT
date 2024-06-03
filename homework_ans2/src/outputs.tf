output "vpc_id" {
  value = module.drych_vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.drych_vpc.public_subnet_ids
}

output "public_instance_ip" {
  value = module.ec2.public_instance_ip
}

