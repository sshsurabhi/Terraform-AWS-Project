output "load_balancer_arn" {
  value = aws_lb.main.arn
}

output "target_group_arn" {
  value = aws_lb_target_group.wordpress_tg.arn
}