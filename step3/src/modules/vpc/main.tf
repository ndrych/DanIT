module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

  name               = var.name
  cidr               = var.cidr
  azs                = var.azs
  public_subnets     = var.public_subnets
  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway
  
  tags = {
    Owner            = "${var.name}-owner"
    CreatedBy        = var.name
    Purpose          = "step3"
  }
}
