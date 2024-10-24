variable "ssh_key_name" {
  description = "The SSH key name for the bastion"
  type        = string
  default     = "SAI-datascientest_keypair"
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

variable "vpc_id" {
  description = "The ID of the VPC where security groups will be created"
  type        = string
}

variable "public_subnet1_id" {
  description = "ID of the first public subnet"
  type        = string
}

variable "public_subnet2_id" {
  description = "ID of the second public subnet"
  type        = string
}

variable "bastion_sg_id" {
  description = "The security group ID for the Bastion host"
  type        = string
}