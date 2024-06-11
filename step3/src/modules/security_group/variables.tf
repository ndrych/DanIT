variable "name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "open_ports" {
  description = "List of ports to be opened"
  type        = list(number)
  default     = [443, 22, 80, 3000, 9090, 9100, 8080]
}
