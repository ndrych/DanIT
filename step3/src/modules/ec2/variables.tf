variable "instance_count" {
  description = "Number of instances to create"
  type        = number
}

variable "name" {
  description = "Name prefix for the instances"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs to associate with the instances"
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of public subnets where the instances will be launched"
  type        = list(string)
}

variable "ansible_user" {
  description = "Username for Ansible SSH connection"
  type        = string
}

variable "private_key" {
  description = "Path to the private key file for Ansible SSH connection"
  type        = string
}

variable "ansible_port" {
  type = number
}
