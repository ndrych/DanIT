variable "name" {
  type = string
}

variable "instance_count" {
  type = number
}

variable "vpc_security_group_ids" {
  type = list(string)
}

variable "subnet_ids" {
  type = list(string)
}

variable "ansible_user" {
  type = string
}

variable "ansible_port" {
  type = number
}

variable "private_key" {
  type = string
}
