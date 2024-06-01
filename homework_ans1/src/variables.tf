variable "name" {
  description = "Name of the VPC and related resources"
  type        = string
  default     = "drych"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets_cidrs" {
  description = "List of CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "open_ports" {
  description = "List of ports to be opened"
  type        = list(number)
  default     = [80, 443, 22]
}

variable "region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "eu-north-1"
}

variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
}

