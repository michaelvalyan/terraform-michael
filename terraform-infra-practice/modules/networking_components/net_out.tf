output "infra_vpc_id" {
  value = aws_vpc.infra_vpc.id
}

output "infra_public_subnet_id" {
  value = aws_subnet.infra_public_subnet.id
}