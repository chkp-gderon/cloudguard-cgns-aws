resource "aws_ec2_transit_gateway" "tgw1" {
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"
  description = join(" ", ["Transit gateway for ",var.region]  )
  tags = {
    Name = join("-", ["TGW", var.region])
  }
}

# Route tables

resource "aws_ec2_transit_gateway_route_table" "cp_route_table1" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw1.id
  tags = {
    Name = join("-", ["TGW", "cp-route-table", "1", "N-S", var.region])
  }
}
resource "aws_ec2_transit_gateway_route_table" "spokes_route_table" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw1.id
  tags = {
    Name = join("-", ["TGW", "spokes-route-table", var.region])
  }
}
resource "aws_ec2_transit_gateway_route_table" "cp_route_table2" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw1.id
  tags = {
    Name = join("-", ["TGW", "cp-route-table", "2", "E-W", var.region])
  }
}

# resource "aws_ec2_transit_gateway_route" "spoke1_tgw_route" {
#   destination_cidr_block         = aws_vpc.spoke1.cidr_block
#   transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.spoke1.id
#   transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.spokes_route_table.id
# }
# resource "aws_ec2_transit_gateway_route" "spoke2_tgw_route" {
#   destination_cidr_block         = aws_vpc.spoke2.cidr_block
#   transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.spoke2.id
#   transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.spokes_route_table.id
# }
# resource "aws_ec2_transit_gateway_route" "access_tgw_route" {
#   destination_cidr_block         = aws_vpc.access1.cidr_block
#   transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.spoke2.id
#   transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.spokes_route_table.id
# }
resource "aws_ec2_transit_gateway_route" "default_tgw_spoke_rt" {
  destination_cidr_block         = "0.0.0.0/0"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.security.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.spokes_route_table.id
}
resource "aws_ec2_transit_gateway_route" "net_10_8_tgw_spoke_rt" {
  destination_cidr_block         = "10.0.0.0/8"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.security.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.spokes_route_table.id
}
resource "aws_ec2_transit_gateway_route" "net_172_16_tgw_spoke_rt" {
  destination_cidr_block         = "172.16.0.0/12"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.security.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.spokes_route_table.id
}
resource "aws_ec2_transit_gateway_route" "net_192_168_tgw_spoke_rt" {
  destination_cidr_block         = "192.168.0.0/16"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.security.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.spokes_route_table.id
}
# Attachments

resource "aws_ec2_transit_gateway_vpc_attachment" "spoke1" {
  vpc_id = aws_vpc.spoke1.id
  transit_gateway_id = aws_ec2_transit_gateway.tgw1.id
  subnet_ids = [aws_subnet.spoke1_tgwa_1a.id, aws_subnet.spoke1_tgwa_1b.id]
}  

resource "aws_ec2_transit_gateway_vpc_attachment" "spoke2" {
  vpc_id = aws_vpc.spoke2.id
  transit_gateway_id = aws_ec2_transit_gateway.tgw1.id
  subnet_ids = [aws_subnet.spoke2_tgwa_1a.id, aws_subnet.spoke2_tgwa_1b.id]
}

resource "aws_ec2_transit_gateway_vpc_attachment" "access1" {
  vpc_id = aws_vpc.access1.id
  transit_gateway_id = aws_ec2_transit_gateway.tgw1.id
  subnet_ids = [aws_subnet.access1_tgwa_1a.id, aws_subnet.access1_tgwa_1b.id]
}

resource "aws_ec2_transit_gateway_vpc_attachment" "security" {
  vpc_id = module.cp_tgw_gwlb_asg.vpc_id
  transit_gateway_id = aws_ec2_transit_gateway.tgw1.id
  subnet_ids = module.cp_tgw_gwlb_asg.tgw_subnets_ids_list
}
resource "aws_ec2_transit_gateway_vpc_attachment" "security2" {
  vpc_id = aws_vpc.security2.id
  transit_gateway_id = aws_ec2_transit_gateway.tgw1.id
  subnet_ids = [aws_subnet.sec2_snet_tgw_1a.id, aws_subnet.sec2_snet_tgw_1b.id]
}
# associations

resource "aws_ec2_transit_gateway_route_table_association" "spoke1" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.spoke1.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.spokes_route_table.id
}
resource "aws_ec2_transit_gateway_route_table_association" "spoke2" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.spoke2.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.spokes_route_table.id
}
resource "aws_ec2_transit_gateway_route_table_association" "access1" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.access1.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.spokes_route_table.id
}
resource "aws_ec2_transit_gateway_route_table_association" "security1" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.security.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.cp_route_table1.id
}
resource "aws_ec2_transit_gateway_route_table_association" "security2" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.security2.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.cp_route_table2.id
}

# propagations

resource "aws_ec2_transit_gateway_route_table_propagation" "spoke1_cp_route_table" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.spoke1.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.cp_route_table1.id
}
resource "aws_ec2_transit_gateway_route_table_propagation" "spoke2_cp_route_table" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.spoke2.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.cp_route_table1.id
}
resource "aws_ec2_transit_gateway_route_table_propagation" "access1_cp_route_table" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.access1.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.cp_route_table1.id
}
#security 2
resource "aws_ec2_transit_gateway_route_table_propagation" "spoke1_cp_route_table2" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.spoke1.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.cp_route_table2.id
}
resource "aws_ec2_transit_gateway_route_table_propagation" "spoke2_cp_route_table2" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.spoke2.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.cp_route_table2.id
}
resource "aws_ec2_transit_gateway_route_table_propagation" "access1_cp_route_table2" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.access1.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.cp_route_table2.id
}
output "aws_ec2_transit_gateway_id" {
  value = aws_ec2_transit_gateway.tgw1.id
}

