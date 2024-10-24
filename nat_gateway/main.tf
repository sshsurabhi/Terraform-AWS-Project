
resource "aws_eip" "public-eip-1" {
  tags = {
    Name = "surabhi-eip-1"
  }
}

resource "aws_nat_gateway" "public-gw-1" {
  allocation_id = aws_eip.public-eip-1.id
  subnet_id     = var.public_subnet1_id
  tags = {
    Name = "surabhi-public-nat-gw-1"
  }
}

resource "aws_route_table" "route_table_app_1" {
  vpc_id = var.vpc_id
  tags = {
    Name = "route_table_app1"
  }
}

resource "aws_route" "route_app1_nat" {
  route_table_id         = aws_route_table.route_table_app_1.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.public-gw-1.id
}


resource "aws_route_table_association" "route_table_subnet_association_app1" {
  subnet_id      = var.private_subnet1_id
  route_table_id = aws_route_table.route_table_app_1.id
}

# nat gateway b
resource "aws_eip" "public-eip-2" {
  tags = {
    Name = "surabhi-eip-2"
  }
}

resource "aws_nat_gateway" "public-gw-2" {
  allocation_id = aws_eip.public-eip-2.id
  subnet_id     = var.public_subnet2_id
  tags = {
    Name = "surabhi-public-nat-gw-2"
  }
}

resource "aws_route_table" "route_table_app_2" {
  vpc_id = var.vpc_id
  tags = {
    Name = "route_table_app2"
  }
}

resource "aws_route" "route_app2_nat" {
  route_table_id         = aws_route_table.route_table_app_2.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.public-gw-2.id
}

resource "aws_route_table_association" "route_table_subnet_association_app2" {
  subnet_id      = var.private_subnet2_id
  route_table_id = aws_route_table.route_table_app_2.id
}
