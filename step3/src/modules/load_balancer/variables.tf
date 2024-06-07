variable "name" {
  description = "Name of the load balancer"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the load balancer will be created"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs where the load balancer will be placed"
  type        = list(string)
}

variable "security_group_id" {
  description = "ID of the security group for the load balancer"
  type        = string
}

variable "instances" {
  description = "List of instance IDs to attach to the load balancer"
  type        = list(string)
}
