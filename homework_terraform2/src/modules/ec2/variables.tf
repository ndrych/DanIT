variable "name" {
  description = "Name of the EC2 instances"
  type        = string
}

variable "public_subnet_id" {
  description = "Public subnet ID"
  type        = string
}

variable "private_subnet_id" {
  description = "Private subnet ID"
  type        = string
}

variable "security_group_id" {
  description = "The security group ID for the instance"
  type        = string
}
