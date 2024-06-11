provider "aws" {
  region                 = var.aws_region
}

provider "template" {}

module "vpc" {
  source                 = "./modules/vpc"
  name                   = var.name
  cidr                   = var.vpc_cidr
  azs                    = var.vpc_azs
  private_subnets        = var.vpc_private_subnets
  public_subnets         = var.vpc_public_subnets
  enable_nat_gateway     = var.enable_nat_gateway
  single_nat_gateway     = var.single_nat_gateway
  }

module "ec2" {
  source                 = "./modules/ec2"
  name                   = var.name
  instance_count         = var.instance_count
  vpc_security_group_ids = [module.security_group.security_group_id]
  subnet_ids             = module.vpc.public_subnets
  ansible_user           = var.ansible_user
  ansible_port           = var.ansible_port
  private_key            = var.private_key
}

module "security_group" {
  source                  = "./modules/security_group"
  name                    = var.name
  vpc_id                  = module.vpc.vpc_id
  open_ports              = var.open_ports
}

module "load_balancer" {
  source                  = "./modules/load_balancer"
  name                    = var.name
  vpc_id                  = module.vpc.vpc_id
  subnet_ids              = module.vpc.public_subnets
  security_group_id       = module.security_group.security_group_id
  instances               = [module.ec2.instances[0]]
}

resource "local_file" "inventory" {
  content = templatefile("${path.module}/inventory.tpl", {
    instances = module.ec2.public_ips,
    instance_ids = module.ec2.instances,
    prometheus_port = var.prometheus_port,
    grafana_port = var.grafana_port,
    node_exporter_port = var.node_exporter_port,
    cadvisor_port = var.cadvisor_port,
    open_ports = var.open_ports,
    name = var.name
  })
  filename = "${path.module}/../ansible/inventory.ini"
}

resource "null_resource" "wait_for_instances" {
  provisioner "local-exec" {
    command = <<EOT
for ip in ${join(" ", module.ec2.public_ips)}; do
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

resource "null_resource" "generate_ansible_hash" {
  provisioner "local-exec" {
    command = <<EOT
find ../ansible -type f -exec sha256sum {} \; | sort -k 2 | sha256sum > ../ansible/ansible_hash.txt
EOT
  }

  triggers = {
    always_run = timestamp()
  }
}

resource "null_resource" "run_ansible" {
  provisioner "local-exec" {
    command = "ANSIBLE_CONFIG=${path.module}/../ansible/ansible.cfg ansible-playbook ${path.module}/../ansible/playbooks/deploy.yml"
  }

  depends_on = [
    null_resource.wait_for_instances,
    null_resource.generate_ansible_hash
  ]

  triggers = {
    instance_ids       = join(",", module.ec2.instances)
    prometheus_port    = var.prometheus_port
    grafana_port       = var.grafana_port
    node_exporter_port = var.node_exporter_port
    cadvisor_port      = var.cadvisor_port
    open_ports         = join(",", var.open_ports)
    ansible_hash       = timestamp()
  }
}
