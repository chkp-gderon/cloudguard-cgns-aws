resource "aws_vpc" "security2" {
  cidr_block = var.security2_vpc_cidr
  tags = {
    Name = join("-", ["security", "2", var.region, var.security2_vpc_cidr])
  }
}
resource "aws_internet_gateway" "security2" {
  vpc_id = aws_vpc.security2.id
  tags = {
    Name = join("-", ["IGW", "security", "2", var.region])
  }
} 
resource "aws_subnet" "sec2_snet_tgw_1a" {
  cidr_block = var.sec2_snet_cidr_tgwa_1a
  availability_zone = var.az1
  vpc_id = aws_vpc.security2.id
    tags = {
    Name = join("-", ["sec", "snet", "2", "tgwa", var.az1, var.sec2_snet_cidr_tgwa_1a])
  }
}
resource "aws_subnet" "sec2_snet_tgw_1b" {
  cidr_block = var.sec2_snet_cidr_tgwa_1b
  availability_zone = var.az2
  vpc_id = aws_vpc.security2.id
    tags = {
    Name = join("-", ["sec", "snet", "2", "tgwa", var.az2, var.sec2_snet_cidr_tgwa_1b])
  }
}
resource "aws_subnet" "sec2_snet_gwlbe_1a" {
  cidr_block = var.sec2_snet_cidr_gwlbe_1a
  availability_zone = var.az1
  vpc_id = aws_vpc.security2.id
    tags = {
    Name = join("-", ["sec", "snet", "2", "gwlbe", var.az1, var.sec2_snet_cidr_gwlbe_1a])
  }
}
resource "aws_subnet" "sec2_snet_gwlbe_1b" {
  cidr_block = var.sec2_snet_cidr_gwlbe_1b
  availability_zone = var.az2
  vpc_id = aws_vpc.security2.id
    tags = {
    Name = join("-", ["sec", "snet", "2","gwlbe", var.az2, var.sec2_snet_cidr_gwlbe_1b])
  }
}
resource "aws_subnet" "sec2_snet_natgw_1a" {
  cidr_block = var.sec2_snet_cidr_natgw_1a
  availability_zone = var.az1
  vpc_id = aws_vpc.security2.id
    tags = {
    Name = join("-", ["sec", "snet", "2", "natgw", var.az1, var.sec2_snet_cidr_natgw_1a])
  }
}
resource "aws_subnet" "sec2_snet_natgw_1b" {
  cidr_block = var.sec2_snet_cidr_natgw_1b
  availability_zone = var.az2
  vpc_id = aws_vpc.security2.id
    tags = {
    Name = join("-", ["sec", "snet", "2", "natgw", var.az2, var.sec2_snet_cidr_natgw_1b])
  }
}
resource "aws_subnet" "sec2_snet_cp_1a" {
  cidr_block = var.sec2_snet_cidr_cp_1a
  availability_zone = var.az1
  vpc_id = aws_vpc.security2.id
    tags = {
    Name = join("-", ["sec", "snet", "2", "cp", var.az1, var.sec2_snet_cidr_cp_1a])
  }
}
resource "aws_subnet" "sec2_snet_cp_1b" {
  cidr_block = var.sec2_snet_cidr_cp_1b
  availability_zone = var.az2
  vpc_id = aws_vpc.security2.id
    tags = {
    Name = join("-", ["sec", "snet", "2", "cp", var.az2, var.sec2_snet_cidr_cp_1b])
  }
}

# NATGW and EIP 
resource "aws_eip" "sec2_nat_gw_public_address1" {
    tags = {
    Name = join("-", ["eip", "natgw", "2", var.az1])
  }
}
resource "aws_eip" "sec2_nat_gw_public_address2" {
    tags = {
    Name = join("-", ["eip", "natgw", "2", var.az2])
  }
}

resource "aws_nat_gateway" "sec2_nat_gateway1" {
  depends_on = [aws_subnet.sec2_snet_natgw_1a, aws_eip.sec2_nat_gw_public_address1]
  allocation_id = aws_eip.sec2_nat_gw_public_address1.id
  subnet_id     = aws_subnet.sec2_snet_natgw_1a.id
  tags = {
    Name = join("-", ["natgw", "2", var.az1])
  }
}
resource "aws_nat_gateway" "sec2_nat_gateway2" {
  depends_on = [aws_subnet.sec2_snet_natgw_1b, aws_eip.sec2_nat_gw_public_address2]
  allocation_id = aws_eip.sec2_nat_gw_public_address2.id
  subnet_id     = aws_subnet.sec2_snet_natgw_1b.id
  tags = {
    Name = join("-", ["natgw", "2", var.az2])
  }
}

# NATGW subnet route tables
resource "aws_route_table" "sec2_nat_gw_subnet1_rtb" {
  vpc_id = aws_vpc.security2.id
  tags = {
    Name = "Sec2 NAT Subnet 1a Route Table"
  }
}
resource "aws_route" "sec2_natgw1a_default_route" {
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.security2.id
    route_table_id = aws_route_table.sec2_nat_gw_subnet1_rtb.id
}
# resource "aws_route" "sec2_natgw1a_10_8_route" {
#     destination_cidr_block = "10.0.0.0/8"
#     vpc_endpoint_id = aws_vpc_endpoint.
#     route_table_id = aws_route_table.sec2_nat_gw_subnet1_rtb.id
# }
# resource "aws_route" "sec2_natgw1a_172_16_route" {
#     destination_cidr_block = "172.16.0.0/22"
#     vpc_endpoint_id = aws_vpc_endpoint.
#     route_table_id = aws_route_table.sec2_nat_gw_subnet1_rtb.id
# }
# resource "aws_route" "sec2_natgw1a_192_168_route" {
#     destination_cidr_block = "192.168.0.0/22"
#     vpc_endpoint_id = aws_vpc_endpoint.
#     route_table_id = aws_route_table.sec2_nat_gw_subnet1_rtb.id
# }
resource "aws_route_table_association" "sec2_natgw1a_rta" {
  route_table_id = aws_route_table.sec2_nat_gw_subnet1_rtb.id
  subnet_id = aws_subnet.sec2_snet_natgw_1a.id
}
# NATGW subnet route tables
resource "aws_route_table" "sec2_nat_gw_subnet2_rtb" {
  vpc_id = aws_vpc.security2.id
  tags = {
    Name = "NAT Subnet 1b Route Table"
  }
}
resource "aws_route" "sec2_natgw1b_default_route" {
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.security2.id
    route_table_id = aws_route_table.sec2_nat_gw_subnet2_rtb.id
}
# resource "aws_route" "sec2_natgw1b_10_8_route" {
#     destination_cidr_block = "10.0.0.0/8"
#     vpc_endpoint_id = aws_vpc_endpoint.
#     route_table_id = aws_route_table.sec2_nat_gw_subnet1_rtb.id
# }
# resource "aws_route" "sec2_natgw1b_172_16_route" {
#     destination_cidr_block = "172.16.0.0/22"
#     vpc_endpoint_id = aws_vpc_endpoint.
#     route_table_id = aws_route_table.sec2_nat_gw_subnet1_rtb.id
# }
# resource "aws_route" "sec2_natgw1b_192_168_route" {
#     destination_cidr_block = "192.168.0.0/22"
#     vpc_endpoint_id = aws_vpc_endpoint.
#     route_table_id = aws_route_table.sec2_nat_gw_subnet1_rtb.id
# }

resource "aws_route_table_association" "sec2_natgw1b_rta" {
  route_table_id = aws_route_table.sec2_nat_gw_subnet2_rtb.id
  subnet_id = aws_subnet.sec2_snet_natgw_1b.id
}

# NATGW subnet route tables
resource "aws_route_table" "sec2_CP_rtb" {
  vpc_id = aws_vpc.security2.id
  tags = {
    Name = "Sec2 CP subnets Route Table"
  }
}
resource "aws_route" "sec2_CP_rtb_default_route" {
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.security2.id
    route_table_id = aws_route_table.sec2_CP_rtb.id
}
resource "aws_route_table_association" "sec2_CP_1a_rta" {
  route_table_id = aws_route_table.sec2_CP_rtb.id
  subnet_id = aws_subnet.sec2_snet_cp_1a.id
}
resource "aws_route_table_association" "sec2_CP_1b_rta" {
  route_table_id = aws_route_table.sec2_CP_rtb.id
  subnet_id = aws_subnet.sec2_snet_cp_1b.id
}

# TGWa subnets
resource "aws_route_table" "sec2_tgw1a_rtb" {
  vpc_id = aws_vpc.security2.id
  tags = {
    Name = "Sec 2 TGW Subnet 1a Route Table"
  }
}
# resource "aws_route" "sec2_tgw1a_default_route" {
#     destination_cidr_block = "0.0.0.0/0"
#     vpc_endpoint_id = aws_vpc_endpoint.
#     route_table_id = aws_route_table.sec2_tgw1a_rtb.id
# }
resource "aws_route_table_association" "sec2_tgw1a_rta" {
  route_table_id = aws_route_table.sec2_tgw1a_rtb.id
  subnet_id = aws_subnet.sec2_snet_tgw_1a.id
}
resource "aws_route_table" "sec2_tgw1b_rtb" {
  vpc_id = aws_vpc.security2.id
  tags = {
    Name = "Sec 2 TGW Subnet 1b Route Table"
  }
}
# resource "aws_route" "sec2_tgw1b_default_route" {
#     destination_cidr_block = "0.0.0.0/0"
#     vpc_endpoint_id = aws_vpc_endpoint.
#     route_table_id = aws_route_table.sec2_tgw1b_rtb.id
# }
resource "aws_route_table_association" "sec2_tgw1b_rta" {
  route_table_id = aws_route_table.sec2_tgw1b_rtb.id
  subnet_id = aws_subnet.sec2_snet_tgw_1b.id
}

resource "aws_route_table" "sec2_gwlb_subnet1a_rtb" {
  vpc_id = aws_vpc.security2.id
  tags = {
    Name = "Sec2 NAT Subnet 1a Route Table"
  }
}
resource "aws_route" "sec2_gwlb1a_default_route" {
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.security2.id
    route_table_id = aws_route_table.sec2_gwlb_subnet1a_rtb.id
}
resource "aws_route" "sec2_gwlb1a_10_8_route" {
    destination_cidr_block = "10.0.0.0/8"
    transit_gateway_id = aws_ec2_transit_gateway.tgw1.id 
    route_table_id = aws_route_table.sec2_gwlb_subnet1a_rtb.id
}
resource "aws_route" "sec2_gwlb1a_172_16_route" {
    destination_cidr_block = "172.16.0.0/22"
    transit_gateway_id = aws_ec2_transit_gateway.tgw1.id 
    route_table_id = aws_route_table.sec2_gwlb_subnet1a_rtb.id
}
resource "aws_route" "sec2_gwlb1a_192_168_route" {
    destination_cidr_block = "192.168.0.0/22"
    transit_gateway_id = aws_ec2_transit_gateway.tgw1.id 
    route_table_id = aws_route_table.sec2_gwlb_subnet1a_rtb.id
}
resource "aws_route_table_association" "sec2_gw1a_rta" {
  route_table_id = aws_route_table.sec2_gwlb_subnet1a_rtb.id
  subnet_id = aws_subnet.sec2_snet_gwlbe_1a.id
}
resource "aws_route_table" "sec2_gwlb_subnet1b_rtb" {
  vpc_id = aws_vpc.security2.id
  tags = {
    Name = "NAT Subnet 1b Route Table"
  }
}
resource "aws_route" "sec2_gw1b_1b_default_route" {
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.security2.id
    route_table_id = aws_route_table.sec2_gwlb_subnet1b_rtb.id
}
resource "aws_route" "sec2_gw1b_1b_10_8_route" {
    destination_cidr_block = "10.0.0.0/8"
    transit_gateway_id = aws_ec2_transit_gateway.tgw1.id 
    route_table_id = aws_route_table.sec2_gwlb_subnet1b_rtb.id
}
resource "aws_route" "sec2_gw1b_1b_172_16_route" {
    destination_cidr_block = "172.16.0.0/22"
    transit_gateway_id = aws_ec2_transit_gateway.tgw1.id 
    route_table_id = aws_route_table.sec2_gwlb_subnet1b_rtb.id
}
resource "aws_route" "sec2_gw1b_1b_192_168_route" {
    destination_cidr_block = "192.168.0.0/22"
    transit_gateway_id = aws_ec2_transit_gateway.tgw1.id 
    route_table_id = aws_route_table.sec2_gwlb_subnet1b_rtb.id
}
resource "aws_route_table_association" "sec2_gw1b1b_rta" {
  route_table_id = aws_route_table.sec2_nat_gw_subnet2_rtb.id
  subnet_id = aws_subnet.sec2_snet_gwlbe_1b.id
}