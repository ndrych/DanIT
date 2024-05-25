provider "aws" {
  region = "eu-north-1"
}

module "drych_vpc" {
  source                = "./modules/vpc"
  name                  = var.name
  vpc_cidr              = var.vpc_cidr
  private_subnets_cidrs = var.private_subnets_cidrs
  public_subnets_cidrs  = var.public_subnets_cidrs
}

module "ec2" {
  source                = "./modules/ec2"
  name                  = var.name
  public_subnet_id      = module.drych_vpc.public_subnets[0]
  private_subnet_id     = module.drych_vpc.private_subnets[0]
  security_group_id     = module.drych_security_group.security_group_id
}

module "drych_security_group" {
  source                = "./modules/security_group"
  vpc_id                = module.drych_vpc.vpc_id
  open_ports            = var.open_ports
}


