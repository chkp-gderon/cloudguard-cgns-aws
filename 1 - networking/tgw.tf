resource "aws_ec2_transit_gateway" "tgw1" {
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"
  description = join(" ", ["Transit gateway for ",var.region]  )
  tags = {
    Name = join("-", "TGW", [var.region])
  }

}