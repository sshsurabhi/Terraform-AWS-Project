variable "cidr_vpc" {
  description = "VPC CIDR"
  default     = "10.1.0.0/16"
}

variable "cidr_public_subnet1" {
  description = "CIDR for public Subnet 1"
  default     = "10.1.0.0/24"
}

variable "cidr_public_subnet2" {
  description = "CIDR for public subnet 2"
  default     = "10.1.1.0/24"
}

variable "cidr_private_subnet1" {
  description = "CIDR for private Subnet 1"
  default     = "10.1.2.0/24"
}

variable "cidr_private_subnet2" {
  description = "CIDR for private Subnet 2"
  default     = "10.1.3.0/24"
}

variable "az_1" {
  description = "availability zone 1"
  default     = "eu-west-3a"
}

variable "az_2" {
  description = "availability zone 2"
  default     = "eu-west-3b"

}