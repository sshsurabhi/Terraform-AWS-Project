resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "public-routetable-dst"
  }
}

resource "aws_route" "igw-route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.datascientest_igw.id
}

resource "aws_route_table_association" "route_table_subnet_association_pub1" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "route_table_subnet_association_pub2" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_route_table.id
}