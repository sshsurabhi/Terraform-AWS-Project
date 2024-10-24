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

variable "db_sg_id" {
  description = "ID of the security group for the RDS instance"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the RDS instances will be created"
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
