terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-north-1"
}



module "drych_vpc" {
  source = "./modules/vpc"
}

module "drych_security_group" {
  source     = "./modules/security_group"
  vpc_id     = module.drych_vpc.vpc_id
  open_ports = var.open_ports
}

module "drych_ec2" {
  source            = "./modules/ec2"
  subnet_id         = module.drych_vpc.subnet_id
  security_group_id = module.drych_security_group.security_group_id
}
