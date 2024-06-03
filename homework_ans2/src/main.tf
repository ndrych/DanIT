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
  open_ports            = concat([var.nginx_port], var.open_ports)
}

resource "local_file" "inventory" {
  content = templatefile("${path.module}/inventory.tpl", {
    instances = module.ec2.public_instance_ip,
    instance_ids = module.ec2.instances,
    nginx_port = var.nginx_port,
    name = var.name,
    open_ports = concat([var.nginx_port], var.open_ports)
  })
  filename = "${path.module}/../ansible/inventory.ini"
}

resource "null_resource" "wait_for_instances" {
  provisioner "local-exec" {
    command = <<EOT
for ip in ${join(" ", module.ec2.public_instance_ip)}; do
  for i in {1..10}; do
    nc -zv $ip 22 && break
    sleep 5
  done
done
EOT
  }

  triggers = {
    instance_ids = join(",", module.ec2.instances)
  }
}

resource "null_resource" "run_ansible" {
  provisioner "local-exec" {
    command = "ANSIBLE_CONFIG=${path.module}/../ansible/ansible.cfg ansible-playbook ${path.module}/../ansible/playbooks/deploy.yml"
  }

  depends_on = [null_resource.wait_for_instances]

  triggers = {
    instance_ids = join(",", module.ec2.instances)
    nginx_port   = var.nginx_port,
    open_ports   = join(",", var.open_ports)
  }
}
