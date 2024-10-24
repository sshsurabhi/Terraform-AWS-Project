resource "aws_instance" "bastion" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t2.micro"
  subnet_id              = var.public_subnet1_id
  key_name               = var.ssh_key_name
  vpc_security_group_ids = [var.bastion_sg_id]
  tags = {
    Name = "my-bastion-host"
  }
}

resource "aws_network_acl" "network-acl-public-1" {
  vpc_id = var.vpc_id

  subnet_ids = [var.public_subnet1_id]

  tags = {
    Name = "network-acl-dst-public-1"
  }
}

resource "aws_network_acl" "network-acl-public-2" {
  vpc_id = var.vpc_id

  subnet_ids = [var.public_subnet2_id]

  tags = {
    Name = "network-acl-dst-public-2"
  }
}

resource "aws_network_acl_rule" "allow_ssh_inbound_a" {
  network_acl_id = aws_network_acl.network-acl-public-1.id
  rule_number    = 100
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 22
  to_port        = 22
}

resource "aws_network_acl_rule" "allow_all_inbound_a" {
  network_acl_id = aws_network_acl.network-acl-public-1.id
  rule_number    = 101
  egress         = false
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "allow_all_outbound_a" {
  network_acl_id = aws_network_acl.network-acl-public-1.id
  rule_number    = 100
  egress         = true
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "allow_ssh_inbound_b" {
  network_acl_id = aws_network_acl.network-acl-public-2.id
  rule_number    = 100
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 22
  to_port        = 22
}

resource "aws_network_acl_rule" "allow_all_inbound_b" {
  network_acl_id = aws_network_acl.network-acl-public-2.id
  rule_number    = 101
  egress         = false
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "allow_all_outbound_b" {
  network_acl_id = aws_network_acl.network-acl-public-2.id
  rule_number    = 100
  egress         = true
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}