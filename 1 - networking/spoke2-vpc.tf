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