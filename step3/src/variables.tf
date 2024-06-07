variable "name" {
  type        = string
  description = "Name prefix for all resources"
  default     = "drych"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
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
}

variable "vpc_private_subnets" {
  type        = list(string)
  description = "List of private subnets CIDR blocks"
}

variable "vpc_public_subnets" {
  type        = list(string)
  description = "List of public subnets CIDR blocks"
}

variable "enable_nat_gateway" {
  type        = bool
  description = "Enable NAT gateway"
}

variable "single_nat_gateway" {
  type        = bool
  description = "Single NAT gateway"
}

variable "ansible_user" {
  type        = string
  description = "Ansible SSH user"
}

variable "ansible_port" {
  type        = number
  description = "Ansible SSH port"
}

variable "prometheus_port" {
  type        = number
  description = "Prometheus port"
}

variable "grafana_port" {
  type        = number
  description = "Grafana port"
}

variable "node_exporter_port" {
  type        = number
  description = "Node Exporter port"
}

variable "cadvisor_port" {
  type        = number
  description = "cAdvisor port"
}

variable "private_key" {
  type        = string
  description = "Path to the private SSH key"
}
