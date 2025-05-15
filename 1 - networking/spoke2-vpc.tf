resource "aws_vpc" "spoke2" {
  cidr_block = var.spoke2_vpc_cidr
  tags = {
    Name = join("-", ["spoke2", var.region, var.spoke2_vpc_cidr])
  }
}

resource "aws_subnet" "spoke2_pub_1a" {
  cidr_block = var.spoke2_snet_cidr_pub_1a
  availability_zone = var.az1
  vpc_id = aws_vpc.spoke2.id
    tags = {
    Name = join("-", ["spoke2", "snet", "pub", var.az1, var.spoke2_snet_cidr_pub_1a])
  }
}
resource "aws_subnet" "spoke2_pub_1b" {
  cidr_block = var.spoke2_snet_cidr_pub_1b
  availability_zone = var.az2
  vpc_id = aws_vpc.spoke2.id
    tags = {
    Name = join("-", ["spoke2", "snet", "pub", var.az2, var.spoke2_snet_cidr_pub_1b])
  }
}
resource "aws_subnet" "spoke2_pri_1a" {
  cidr_block = var.spoke2_snet_cidr_pri_1a
  availability_zone = var.az1
  vpc_id = aws_vpc.spoke2.id
    tags = {
    Name = join("-", ["spoke2", "snet", "pri", var.az1, var.spoke2_snet_cidr_pri_1a])
  }
}
resource "aws_subnet" "spoke2_pri_1b" {
  cidr_block = var.spoke2_snet_cidr_pri_1b
  availability_zone = var.az2
  vpc_id = aws_vpc.spoke2.id
    tags = {
    Name = join("-", ["spoke2", "snet", "pri", var.az2, var.spoke2_snet_cidr_pri_1b])
  }
}
resource "aws_subnet" "spoke2_tgwa_1a" {
  cidr_block = var.spoke2_snet_tgwa_1a
  availability_zone = var.az1
  vpc_id = aws_vpc.spoke2.id
    tags = {
    Name = join("-", ["spoke2", "snet", "tgwa", var.az1, var.spoke2_snet_tgwa_1a])
  }
}
resource "aws_subnet" "spoke2_tgwa_1b" {
  cidr_block = var.spoke2_snet_tgwa_1b
  availability_zone = var.az2
  vpc_id = aws_vpc.spoke2.id
    tags = {
    Name = join("-", ["spoke2", "snet", "tgwa", var.az2, var.spoke2_snet_tgwa_1b])
  }
}


resource "aws_route_table" "spoke2_rt" {
  vpc_id = aws_vpc.spoke2.id
  tags = {
    Name = join("-", ["spoke2", "rt"])
  }

}
resource "aws_route" "spoke2_A_route" {
  route_table_id = aws_route_table.spoke2_rt.id
  destination_cidr_block = "10.0.0.0/8"
  transit_gateway_id = aws_ec2_transit_gateway.tgw1.id
}
resource "aws_route" "spoke2_B_route" {
  route_table_id = aws_route_table.spoke2_rt.id
  destination_cidr_block = "172.16.0.0/12"
  transit_gateway_id = aws_ec2_transit_gateway.tgw1.id
}
resource "aws_route" "spoke2_c_route" {
  route_table_id = aws_route_table.spoke2_rt.id
  destination_cidr_block = "192.168.0.0/16"
  transit_gateway_id = aws_ec2_transit_gateway.tgw1.id
}
resource "aws_route" "spoke2_default_route" {
  route_table_id = aws_route_table.spoke2_rt.id
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_id = aws_ec2_transit_gateway.tgw1.id
}
resource "aws_route_table_association" "spoke2_pri1a_rta" {
  route_table_id = aws_route_table.spoke2_rt.id
  subnet_id = aws_subnet.spoke2_pri_1a.id
}
resource "aws_route_table_association" "spoke2_pri1b_rta" {
  route_table_id = aws_route_table.spoke2_rt.id
  subnet_id = aws_subnet.spoke2_pri_1b.id
}
resource "aws_route_table_association" "spoke2_pub1a_rta" {
  route_table_id = aws_route_table.spoke2_rt.id
  subnet_id = aws_subnet.spoke2_pub_1a.id
}
resource "aws_route_table_association" "spoke2_pub1b_rta" {
  route_table_id = aws_route_table.spoke2_rt.id
  subnet_id = aws_subnet.spoke2_pub_1b.id
}
resource "aws_route_table_association" "spoke2_tgw1a_rta" {
  route_table_id = aws_route_table.spoke2_rt.id
  subnet_id = aws_subnet.spoke2_tgwa_1a.id
}
resource "aws_route_table_association" "spoke2_tgw1b_rta" {
  route_table_id = aws_route_table.spoke2_rt.id
  subnet_id = aws_subnet.spoke2_tgwa_1b.id
}
output "spoke2_vpc_id" {
  value = aws_vpc.spoke2.id
}
output "spoke2_pub_1a_id" {
  value = aws_subnet.spoke2_pub_1a.id
}
output "spoke2_pub_1b_id" {
  value = aws_subnet.spoke2_pub_1b.id
}
output "spoke2_pri_1a_id" {
  value = aws_subnet.spoke2_pri_1a.id
}
output "spoke2_pri_1b_id" {
  value = aws_subnet.spoke2_pri_1b.id
}
output "spoke2_snet_tgw1a_id" {
  value = aws_subnet.spoke2_tgwa_1a.id
}
output "spoke2_snet_tgw1b_id" {
  value = aws_subnet.spoke2_tgwa_1b.id
}
