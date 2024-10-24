output "db_instance_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = aws_db_instance.wordpressdb.endpoint
}

output "db_subnet_group" {
  description = "The DB subnet group"
  value       = aws_db_subnet_group.my_db_subnet_group.name
}