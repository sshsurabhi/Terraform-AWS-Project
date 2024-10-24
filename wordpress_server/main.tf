resource "aws_launch_template" "wordpress_server" {
  name          = "wordpress-launch-terminal"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  key_name       = var.ssh_key_name

  user_data = base64encode(templatefile("${path.module}/install-wordpress.sh", {
    db_name          = var.db_name
    db_username      = var.db_user
    db_user_password = var.db_password
    db_RDS           = var.db_endpoint
  }))

  vpc_security_group_ids = [var.wordpress_sg_id]
}

resource "aws_autoscaling_group" "wordpress_asg" {
  name                = "wordpress-asg"
  desired_capacity    = 2
  max_size            = 2
  min_size            = 1
  vpc_zone_identifier = [var.private_subnet1_id, var.private_subnet2_id]

  launch_template {
    id      = aws_launch_template.wordpress_server.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "wordpress-server-instance"
    propagate_at_launch = true
  }
}