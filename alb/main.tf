resource "aws_lb" "main" {
  name               = "wordpress-alb"
  internal           = false
  load_balancer_type = "application"

  subnets         = [var.public_subnet1_id, var.public_subnet2_id]
  security_groups = [var.alb_sg_id]

  enable_deletion_protection = false
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.wordpress_tg.arn
  }
}

resource "aws_lb_target_group" "wordpress_tg" {
  name     = "wordpress-targetgroup"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/wp-admin/install.php"
    protocol            = "HTTP"
    matcher             = "200,301,302"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

resource "aws_autoscaling_attachment" "targetgroup_attachment" {
  autoscaling_group_name = var.wordpress_asg_id
  lb_target_group_arn    = aws_lb_target_group.wordpress_tg.arn
}