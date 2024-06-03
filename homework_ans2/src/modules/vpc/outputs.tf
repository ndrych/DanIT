output "vpc_id" {
  value = aws_vpc.drych_vpc.id
}

output "public_subnet_ids" {
  value = aws_subnet.drych_public_subnet[*].id
}

