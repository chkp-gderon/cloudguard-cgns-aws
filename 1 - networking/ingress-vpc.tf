resource "aws_vpc" "ingress1" {
  cidr_block = var.ingress1_vpc_cidr
  tags = {
    Name = join("-", ["ingress1", var.region, var.ingress1_vpc_cidr])
  }
}
resource "aws_internet_gateway" "ingress1_igw" {
  vpc_id = aws_vpc.ingress1.id
  tags = {
    Name = join("-", ["ingress1", "IGW", var.region])
  }
}
resource "aws_subnet" "ingress1_pub_1a" {
  cidr_block = var.ingress1_snet_cidr_pub_1a
  availability_zone = var.az1
  vpc_id = aws_vpc.ingress1.id
    tags = {
    Name = join("-", ["ingress1", "snet", "pub", var.az1, var.ingress1_snet_cidr_pub_1a])
  }
}
resource "aws_subnet" "ingress1_pub_1b" {
  cidr_block = var.ingress1_snet_cidr_pub_1b
  availability_zone = var.az2
  vpc_id = aws_vpc.ingress1.id
    tags = {
    Name = join("-", ["ingress1", "snet", "pub", var.az2, var.ingress1_snet_cidr_pub_1b])
  }
}
resource "aws_subnet" "ingress1_gwlbe_1a" {
  cidr_block = var.ingress1_snet_cidr_gwlbe_1a
  availability_zone = var.az1
  vpc_id = aws_vpc.ingress1.id
    tags = {
    Name = join("-", ["ingress1", "snet", "pri", var.az1, var.ingress1_snet_cidr_gwlbe_1a])
  }
}
resource "aws_subnet" "ingress1_gwlbe_1b" {
  cidr_block = var.ingress1_snet_cidr_gwlbe_1b
  availability_zone = var.az2
  vpc_id = aws_vpc.ingress1.id
    tags = {
    Name = join("-", ["ingress1", "snet", "pri", var.az2, var.ingress1_snet_cidr_gwlbe_1b])
  }
}

resource "aws_subnet" "ingress1_tgwa_1a" {
  cidr_block = var.ingress1_snet_tgwa_1a
  availability_zone = var.az1
  vpc_id = aws_vpc.ingress1.id
    tags = {
    Name = join("-", ["ingress1", "snet", "tgwa", var.az1, var.ingress1_snet_tgwa_1a])
  }
}
resource "aws_subnet" "ingress1_tgwa_1b" {
  cidr_block = var.ingress1_snet_tgwa_1b
  availability_zone = var.az2
  vpc_id = aws_vpc.ingress1.id
    tags = {
    Name = join("-", ["ingress1", "snet", "tgwa", var.az2, var.ingress1_snet_tgwa_1b])
  }
}


# resource "aws_route_table" "ingress1_rt" {
#   vpc_id = aws_vpc.ingress1.id
#   tags = {
#     Name = join("-", ["ingress1", "rt", var.region])
#   }
# }
# resource "aws_route" "ingress1_A_route" {
#   route_table_id = aws_route_table.ingress1_rt.id
#   destination_cidr_block = "10.0.0.0/8"
#   transit_gateway_id = aws_ec2_transit_gateway.tgw1.id
# }
# resource "aws_route" "ingress1_B_route" {
#   route_table_id = aws_route_table.ingress1_rt.id
#   destination_cidr_block = "172.16.0.0/12"
#   transit_gateway_id = aws_ec2_transit_gateway.tgw1.id
# }
# resource "aws_route" "ingress1_c_route" {
#   route_table_id = aws_route_table.ingress1_rt.id
#   destination_cidr_block = "192.168.0.0/16"
#   transit_gateway_id = aws_ec2_transit_gateway.tgw1.id
# }
# resource "aws_route" "ingress1_default_route" {
#   route_table_id = aws_route_table.ingress1_rt.id
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id = aws_internet_gateway.access_igw.id
# }

# resource "aws_route_table_association" "ingress1_pub1a_rta" {
#   route_table_id = aws_route_table.ingress1_rt.id
#   subnet_id = aws_subnet.ingress1_pub_1a.id
# }
# resource "aws_route_table_association" "ingress1_pub1b_rta" {
#   route_table_id = aws_route_table.ingress1_rt.id
#   subnet_id = aws_subnet.ingress1_pub_1b.id
# }
# resource "aws_route_table_association" "ingress1_tgw1a_rta" {
#   route_table_id = aws_route_table.ingress1_rt.id
#   subnet_id = aws_subnet.ingress1_tgwa_1a.id
# }
# resource "aws_route_table_association" "ingress1_tgw1b_rta" {
#   route_table_id = aws_route_table.ingress1_rt.id
#   subnet_id = aws_subnet.ingress1_tgwa_1b.id
# }

# # Ingress Routing / edge association 
# resource "aws_route_table" "ingress1_rt_edge_1a" {
#   vpc_id = aws_vpc.ingress1.id
#   tags = {
#     Name = join("-", ["ingress1", "rt", "edge-1a",  var.region])
#   }
# }
# resource "aws_route" "ingress1_server_route_1a" {
#   route_table_id = aws_route_table.ingress1_rt_edge_1a.id
#   destination_cidr_block = aws_subnet.ingress1_pub_1a.cidr_block
#   vpc_endpoint_id = xxx
# }
# resource "aws_route" "ingress1_local_route_1a" {
#   route_table_id = aws_route_table.ingress1_rt_edge_1a.id
#   destination_cidr_block = aws_vpc.ingress1.cidr_block
#   vpc_endpoint_id = xxx
# }

# resource "aws_route_table" "ingress1_rt_edge_1b" {
#   vpc_id = aws_vpc.ingress1.id
#   tags = {
#     Name = join("-", ["ingress1", "rt", "edge-1b",  var.region])
#   }
# }
# resource "aws_route" "ingress1_server_route_1b" {
#   route_table_id = aws_route_table.ingress1_rt_edge_1b.id
#   destination_cidr_block = aws_subnet.ingress1_pub_1b.cidr_block
#   vpc_endpoint_id = xxx # AZ1 GWLBe
# }
# resource "aws_route" "ingress1_local_route_1b" {
#   route_table_id = aws_route_table.ingress1_rt_edge_1b.id
#   destination_cidr_block = aws_vpc.ingress1.cidr_block
#   vpc_endpoint_id = xxx # AZ2 GWLBe
# }

# resource "aws_route_table_association" "ingress1_edge_1a_rta" {
#   route_table_id = aws_route_table.ingress1_rt_edge_1a.id
#   gateway_id = aws_internet_gateway.ingress1_igw.id
# }
# resource "aws_route_table_association" "ingress1_edge_1b_rta" {
#   route_table_id = aws_route_table.ingress1_rt_edge_1b.id
#   gateway_id = aws_internet_gateway.ingress1_igw.id
# }

# # gwlbe's. 
# resource "aws_vpc_endpoint" "gwlb_endpoint1" {
#   depends_on = [module.gwlb, aws_subnet.gwlbe_subnet1]
#   vpc_id = aws_vpc.ingress1.id
#   vpc_endpoint_type = "GatewayLoadBalancer"
#   service_name = module.gwlb.gwlb_service_name
#   subnet_ids = [aws_subnet.ingress1_gwlbe_1a.id]
#   tags = {
#     "Name" = join("-", ["gwlbe", "1", var.az1])
#   }
# }
# resource "aws_vpc_endpoint" "gwlb_endpoint2" {
#   depends_on = [module.gwlb, aws_subnet.gwlbe_subnet1]
#   vpc_id = aws_vpc.ingress1.id
#   vpc_endpoint_type = "GatewayLoadBalancer"
#   service_name = module.cp_tgw_gwlb_asg.gwlb_service_name
#   subnet_ids = [aws_subnet.ingress1_gwlbe_1b.id]
#   tags = {
#     "Name" = join("-", ["gwlbe", "2", var.az1])
#   }
# }



# outputs
output "ingress1_vpc_id" {
  value = aws_vpc.ingress1.id
}
output "ingress1_pub_1a_id" {
  value = aws_subnet.ingress1_pub_1a.id
}
output "ingress1_pub_1b_id" {
  value = aws_subnet.ingress1_pub_1b.id
}
output "ingress1_pri_1a_id" {
  value = aws_subnet.ingress1_gwlbe_1a.id
}
output "ingress1_pri_1b_id" {
  value = aws_subnet.ingress1_gwlbe_1b.id
}

