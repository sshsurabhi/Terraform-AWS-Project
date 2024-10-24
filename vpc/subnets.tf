resource "aws_subnet" "public_subnet1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.cidr_public_subnet1
  availability_zone       = var.az_1
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-1"
  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.cidr_public_subnet2
  availability_zone       = var.az_2
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-2"
  }
}

resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.cidr_private_subnet1
  availability_zone = var.az_1
  tags = {
    Name = "private-subnet-1"
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.cidr_private_subnet2
  availability_zone = var.az_2
  tags = {
    Name = "private-subnet-2"
  }
}