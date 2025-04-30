# resource "aws_vpc" "security" {
#   cidr_block = var.security_vpc_cidr
#   tags = {
#     Name = join("-", ["security", var.region, var.security_vpc_cidr])
#   }
# }
# resource "aws_internet_gateway" "this" {
#   vpc_id = aws_vpc.security.id
#   tags = {
#     Name = join("-", ["IGW", "security", var.region])
#   }
# } 
# resource "aws_subnet" "sec_snet_tgw_1a" {
#   cidr_block = var.sec_snet_cidr_tgwa_1a
#   availability_zone = var.az1
#   vpc_id = aws_vpc.security.id
#     tags = {
#     Name = join("-", ["sec", "snet", "tgwa", var.az1, var.sec_snet_cidr_tgwa_1a])
#   }
# }
# resource "aws_subnet" "sec_snet_tgw_1b" {
#   cidr_block = var.sec_snet_cidr_tgwa_1b
#   availability_zone = var.az2
#   vpc_id = aws_vpc.security.id
#     tags = {
#     Name = join("-", ["sec", "snet", "tgwa", var.az2, var.sec_snet_cidr_tgwa_1b])
#   }
# }
# resource "aws_subnet" "sec_snet_gwlbe_1a" {
#   cidr_block = var.sec_snet_cidr_gwlbe_1a
#   availability_zone = var.az1
#   vpc_id = aws_vpc.security.id
#     tags = {
#     Name = join("-", ["sec", "snet", "gwlbe", var.az1, var.sec_snet_cidr_gwlbe_1a])
#   }
# }
# resource "aws_subnet" "sec_snet_gwlbe_1b" {
#   cidr_block = var.sec_snet_cidr_gwlbe_1b
#   availability_zone = var.az2
#   vpc_id = aws_vpc.security.id
#     tags = {
#     Name = join("-", ["sec", "snet", "gwlbe", var.az2, var.sec_snet_cidr_gwlbe_1b])
#   }
# }
# resource "aws_subnet" "sec_snet_natgw_1a" {
#   cidr_block = var.sec_snet_cidr_natgw_1a
#   availability_zone = var.az1
#   vpc_id = aws_vpc.security.id
#     tags = {
#     Name = join("-", ["sec", "snet", "natgw", var.az1, var.sec_snet_cidr_natgw_1a])
#   }
# }
# resource "aws_subnet" "sec_snet_natgw_1b" {
#   cidr_block = var.sec_snet_cidr_natgw_1b
#   availability_zone = var.az2
#   vpc_id = aws_vpc.security.id
#     tags = {
#     Name = join("-", ["sec", "snet", "natgw", var.az2, var.sec_snet_cidr_natgw_1b])
#   }
# }
# resource "aws_subnet" "sec_snet_cp_1a" {
#   cidr_block = var.sec_snet_cidr_cp_1a
#   availability_zone = var.az1
#   vpc_id = aws_vpc.security.id
#     tags = {
#     Name = join("-", ["sec", "snet", "cp", var.az1, var.sec_snet_cidr_cp_1a])
#   }
# }
# resource "aws_subnet" "sec_snet_cp_1b" {
#   cidr_block = var.sec_snet_cidr_cp_1b
#   availability_zone = var.az2
#   vpc_id = aws_vpc.security.id
#     tags = {
#     Name = join("-", ["sec", "snet", "cp", var.az2, var.sec_snet_cidr_cp_1b])
#   }
# }

# # NATGW and EIP 
# resource "aws_eip" "nat_gw_public_address1" {
#     tags = {
#     Name = join("-", ["eip", "natgw", var.az1])
#   }
# }
# resource "aws_eip" "nat_gw_public_address2" {
#     tags = {
#     Name = join("-", ["eip", "natgw", var.az2])
#   }
# }

# resource "aws_nat_gateway" "nat_gateway1" {
#   depends_on = [aws_subnet.sec_snet_natgw_1a, aws_eip.nat_gw_public_address1]
#   allocation_id = aws_eip.nat_gw_public_address1.id
#   subnet_id     = aws_subnet.sec_snet_natgw_1a.id
#   tags = {
#     Name = join("-", ["natgw", var.az1])
#   }
# }
# resource "aws_nat_gateway" "nat_gateway2" {
#   depends_on = [aws_subnet.sec_snet_natgw_1b, aws_eip.nat_gw_public_address2]
#   allocation_id = aws_eip.nat_gw_public_address2.id
#   subnet_id     = aws_subnet.sec_snet_natgw_1b.id
#   tags = {
#     Name = join("-", ["natgw", var.az2])
#   }
# }

# # NATGW subnet route tables
# # resource "aws_route_table" "nat_gw_subnet1_rtb" {
# #   vpc_id = aws_vpc.security.id
# #   route{
# #     cidr_block = "0.0.0.0/0"
# #     gateway_id = var.internet_gateway_id
# #   }
# #   tags = {
# #     Name = "NAT Subnet 2 Route Table"
# #     Network = "Public"
# #   }
# # }
# # resource "aws_route_table_association" "nat_gw_subnet2_rtb_assoc" {
# #   subnet_id      = aws_subnet.nat_gw_subnet2.id
# #   route_table_id = aws_route_table.nat_gw_subnet2_rtb.id
# # }

