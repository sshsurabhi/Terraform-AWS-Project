output "wordpress_sg_id" {
  description = "The ID of the web security group"
  value       = aws_security_group.wordpress_sg.id
}

output "db_sg_id" {
  description = "The ID of the database security group"
  value       = aws_security_group.db_sg.id
}

output "alb_sg_id" {
  description = "The ID of the load balancer security group"
  value       = aws_security_group.alb_sg.id
}

output "bastion_sg_id" {
  description = "The ID of the bastion security group"
  value       = aws_security_group.bastion_sg.id
}