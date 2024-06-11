variable "name" {
  description = "The name prefix for resources in this module"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the load balancer and target group will be deployed"
  type        = string
}

variable "security_group_id" {
  description = "The ID of the security group to associate with the load balancer"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs where the load balancer will be deployed"
  type        = list(string)
}

variable "instances" {
  description = "List of instance IDs to attach to the target group"
  type        = list(string)
}

