resource "aws_vpc" "access1" {
  cidr_block = var.access1_vpc_cidr
  tags = {
    Name = join("-", ["access1", var.region, var.access1_vpc_cidr])
  }
}
resource "aws_internet_gateway" "access_igw" {
  vpc_id = aws_vpc.access1.id
  tags = {
    Name = join("-", ["access1", "IGW", var.region, var.access1_vpc_cidr])
  }
}
resource "aws_subnet" "access1_pub_1a" {
  cidr_block = var.access1_snet_cidr_pub_1a
  availability_zone = var.az1
  vpc_id = aws_vpc.access1.id
    tags = {
    Name = join("-", ["access1", "snet", "pub", var.az1, var.access1_snet_cidr_pub_1a])
  }
}
resource "aws_subnet" "access1_pub_1b" {
  cidr_block = var.access1_snet_cidr_pub_1b
  availability_zone = var.az2
  vpc_id = aws_vpc.access1.id
    tags = {
    Name = join("-", ["access1", "snet", "pub", var.az2, var.access1_snet_cidr_pub_1b])
  }
}
resource "aws_subnet" "access1_pri_1a" {
  cidr_block = var.access1_snet_cidr_pri_1a
  availability_zone = var.az1
  vpc_id = aws_vpc.access1.id
    tags = {
    Name = join("-", ["access1", "snet", "pri", var.az1, var.access1_snet_cidr_pri_1a])
  }
}
resource "aws_subnet" "access1_pri_1b" {
  cidr_block = var.access1_snet_cidr_pri_1b
  availability_zone = var.az2
  vpc_id = aws_vpc.access1.id
    tags = {
    Name = join("-", ["access1", "snet", "pri", var.az2, var.access1_snet_cidr_pri_1b])
  }
}

resource "aws_subnet" "access1_tgwa_1a" {
  cidr_block = var.access_snet_tgwa_1a
  availability_zone = var.az1
  vpc_id = aws_vpc.access1.id
    tags = {
    Name = join("-", ["access1", "snet", "tgwa", var.az1, var.access_snet_tgwa_1a])
  }
}
resource "aws_subnet" "access1_tgwa_1b" {
  cidr_block = var.access_snet_tgwa_1b
  availability_zone = var.az2
  vpc_id = aws_vpc.access1.id
    tags = {
    Name = join("-", ["access1", "snet", "tgwa", var.az2, var.access_snet_tgwa_1b])
  }
}
