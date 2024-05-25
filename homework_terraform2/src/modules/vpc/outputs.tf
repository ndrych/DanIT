output "vpc_id" {
  value = aws_vpc.drych_vpc.id
}

output "public_subnets" {
  value = aws_subnet.drych_public_subnet.*.id
}

output "private_subnets" {
  value = aws_subnet.drych_private_subnet.*.id
}
