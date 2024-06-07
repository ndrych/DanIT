variable "name" {
  type        = string
  description = "Name prefix for all resources"
  default     = "drych"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "eu-north-1"
}

variable "instance_count" {
  type        = number
  description = "Number of EC2 instances to create"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_azs" {
  type        = list(string)
  description = "List of availability zones"
  default     = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
}

variable "vpc_public_subnets" {
  type        = list(string)
  description = "List of public subnets CIDR blocks"
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "vpc_private_subnets" {
  type        = list(string)
  description = "List of private subnets CIDR blocks"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "enable_nat_gateway" {
  type        = bool
  description = "Enable NAT gateway"
  default     = true
}

variable "single_nat_gateway" {
  type        = bool
  description = "Single NAT gateway"
  default     = false
}

variable "ansible_user" {
  type        = string
  description = "Ansible SSH user"
  default     = "ec2-user"
}

variable "ansible_port" {
  type        = number
  description = "Ansible SSH port"
  default     = 22
}

variable "prometheus_port" {
  type        = number
  description = "Prometheus port"
  default     = 9090
}

variable "grafana_port" {
  type        = number
  description = "Grafana port"
  default     = 3000
}

variable "node_exporter_port" {
  type        = number
  description = "Node Exporter port"
  default     = 9100
}

variable "cadvisor_port" {
  type        = number
  description = "cAdvisor port"
  default     = 8080
}

variable "private_key" {
  type        = string
  description = "Path to the private SSH key"
  default     = "~/.ssh/drych2-key.pem"
}

variable "open_ports" {
  description = "List of ports to be opened"
  type        = list(number)
  default     = [443, 22, 80]
}

