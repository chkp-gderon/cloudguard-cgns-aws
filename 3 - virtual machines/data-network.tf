data "aws_key_pair" "ssh_key" {
  key_name = var.ssh_key_name
}

data "aws_vpc" "spoke1" {
  id = var.spoke1_vpc_id
}

data "aws_subnet" "spoke1_pri_1a_id" {
  id = var.spoke1_pri_1a_id
}
data "aws_subnet" "spoke1_pri_1b_id" {
  id = var.spoke1_pri_1b_id
}
data "aws_subnet" "spoke1_pub_1a_id" {
  id = var.spoke1_pub_1a_id
}
data "aws_subnet" "spoke1_pub_1b_id" {
  id = var.spoke1_pub_1b_id
}

data "aws_vpc" "spoke2" {
  id = var.spoke2_vpc_id
}

data "aws_subnet" "spoke2_pri_1a_id" {
  id = var.spoke2_pri_1a_id
}
data "aws_subnet" "spoke2_pri_1b_id" {
  id = var.spoke2_pri_1b_id
}
data "aws_subnet" "spoke2_pub_1a_id" {
  id = var.spoke2_pub_1a_id
}
data "aws_subnet" "spoke2_pub_1b_id" {
  id = var.spoke2_pub_1b_id
}

data "aws_vpc" "access1" {
  id = var.access1_vpc_id
}

data "aws_subnet" "access1_pri_1a_id" {
  id = var.access1_pri_1a_id
}
data "aws_subnet" "access1_pri_1b_id" {
  id = var.access1_pri_1b_id
}
data "aws_subnet" "access1_pub_1a_id" {
  id = var.access1_pub_1a_id
}
data "aws_subnet" "access1_pub_1b_id" {
  id = var.access1_pub_1b_id
}
data "aws_ec2_managed_prefix_list" "this" {
  id = var.prefix_list_id
}