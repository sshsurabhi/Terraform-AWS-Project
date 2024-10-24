output "nat_gateway_public1_id" {
  description = "The ID of the NAT Gateway in public subnet A"
  value       = aws_nat_gateway.public-gw-1.id
}

output "nat_gateway_public2_id" {
  description = "The ID of the NAT Gateway in public subnet B"
  value       = aws_nat_gateway.public-gw-2.id
}