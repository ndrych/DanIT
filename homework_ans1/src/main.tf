provider "aws" {
  region = "eu-north-1"
}

provider "template" {}

module "drych_vpc" {
  source                = "./modules/vpc"
  name                  = var.name
  vpc_cidr              = var.vpc_cidr
  public_subnets_cidrs  = var.public_subnets_cidrs
}

module "ec2" {
  source                = "./modules/ec2"
  name                  = var.name
  public_subnet_ids     = module.drych_vpc.public_subnet_ids 
  security_group_id     = module.drych_security_group.security_group_id
  instance_count        = var.instance_count
}


module "drych_security_group" {
  source                = "./modules/security_group"
  vpc_id                = module.drych_vpc.vpc_id
  open_ports            = var.open_ports
}

resource "local_file" "inventory" {
  content               = templatefile("${path.module}/inventory.tpl", {
  instances             = module.ec2.public_instance_ip
  })
  filename              = "${path.module}/../ansible/inventory.ini"
}
