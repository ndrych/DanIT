variable "name" {
  description = "Name of the EC2 instances"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs"
  type        = list (string)
}

variable "security_group_id" {
  description = "The security group ID for the instance"
  type        = string
}

variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
}
