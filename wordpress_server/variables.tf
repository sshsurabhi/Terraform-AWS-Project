variable "db_name" {
  description = "The name for the wordpress DB in MariaDB"
  type        = string
  default     = "wpdb"
}

variable "db_user" {
  description = "The user for the MariaDB instance"
  type        = string
  default     = "wpuser"
}

variable "db_password" {
  description = "The password for the MariaDB instance"
  type        = string
  sensitive   = true
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

variable "wordpress_sg_id" {
  description = "ID of the security group for the web servers"
  type        = string
}

variable "db_endpoint" {
  description = "Endpoint of the database"
  type        = string
}

variable "private_subnet1_id" {
  description = "ID of the first private subnet"
  type        = string
}

variable "private_subnet2_id" {
  description = "ID of the second private subnet"
  type        = string
}

variable "ssh_key_name" {
  description = "The SSH key name for the instances"
  type        = string
  default     = "keypair-for-terraform"
}