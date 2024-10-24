terraform {
 backend "s3" {
   bucket = "datascientest-bucket-terraform-s3-surabhi"
   key = "terraform.tfstate"
   region = "eu-west-3"
 }

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = "eu-west-3"
  access_key = ""
  secret_key = ""
}

module "vpc" {
  source = "./vpc"
}

module "nat_gateway" {
  source = "./nat_gateway"
  vpc_id               = module.vpc.vpc_id
  public_subnet1_id    = module.vpc.public_subnet1_id
  public_subnet2_id    = module.vpc.public_subnet2_id
  private_subnet1_id   = module.vpc.private_subnet1_id
  private_subnet2_id   = module.vpc.private_subnet2_id
}

module "wordpress_server" {
  source = "./wordpress_server"
  db_password         = var.db_password
  private_subnet1_id  = module.vpc.private_subnet1_id
  private_subnet2_id  = module.vpc.private_subnet2_id
  wordpress_sg_id     = module.security_groups.wordpress_sg_id
  db_endpoint         = module.rds.db_instance_endpoint
}

module "rds" {
  source = "./rds"
  db_password        = var.db_password
  vpc_id             = module.vpc.vpc_id
  private_subnet1_id = module.vpc.private_subnet1_id
  private_subnet2_id = module.vpc.private_subnet2_id
  db_sg_id           = module.security_groups.db_sg_id
}

module "alb" {
  source = "./alb"
  public_subnet1_id  = module.vpc.public_subnet1_id
  public_subnet2_id  = module.vpc.public_subnet2_id
  alb_sg_id           = module.security_groups.alb_sg_id
  vpc_id              = module.vpc.vpc_id
  wordpress_asg_id    = module.wordpress_server.wordpress_asg_id
}

module "baston" {
  source = "./baston"
  vpc_id             = module.vpc.vpc_id
  public_subnet1_id = module.vpc.public_subnet1_id
  public_subnet2_id = module.vpc.public_subnet2_id
  bastion_sg_id      = module.security_groups.bastion_sg_id
}

module "security_groups" {
  source = "./security_groups"
  vpc_id = module.vpc.vpc_id
}