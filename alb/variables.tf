// load_balancer/variables.tf
variable "public_subnet1_id" {
  description = "ID of first public subnet"
  type        = string
}

variable "public_subnet2_id" {
  description = "ID of second public subnet"
  type        = string
}

variable "alb_sg_id" {
  description = "ID of security group for load balancer"
  type        = string
}

variable "vpc_id" {
  description = "ID of VPC where load balancer is deployed"
  type        = string
}

variable "wordpress_asg_id" {
  description = "The id of the aws_autoscaling_group"
  type = string
}