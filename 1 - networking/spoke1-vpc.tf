resource "aws_vpc" "spoke1" {
  cidr_block = var.spoke1_vpc_cidr
  tags = {
    Name = join("-", ["spoke1", var.region, var.spoke1_vpc_cidr])
  }
}

resource "aws_subnet" "spoke1_pub_1a" {
  cidr_block = var.spoke1_snet_cidr_pub_1a
  availability_zone = var.az1
  vpc_id = aws_vpc.spoke1.id
    tags = {
    Name = join("-", ["spoke1", "snet", "pub", var.az1, var.spoke1_snet_cidr_pub_1a])
  }
}
resource "aws_subnet" "spoke1_pub_1b" {
  cidr_block = var.spoke1_snet_cidr_pub_1b
  availability_zone = var.az2
  vpc_id = aws_vpc.spoke1.id
    tags = {
    Name = join("-", ["spoke1", "snet", "pub", var.az2, var.spoke1_snet_cidr_pub_1b])
  }
}
resource "aws_subnet" "spoke1_pri_1a" {
  cidr_block = var.spoke1_snet_cidr_pri_1a
  availability_zone = var.az1
  vpc_id = aws_vpc.spoke1.id
    tags = {
    Name = join("-", ["spoke1", "snet", "pri", var.az1, var.spoke1_snet_cidr_pri_1a])
  }
}
resource "aws_subnet" "spoke1_pri_1b" {
  cidr_block = var.spoke1_snet_cidr_pri_1b
  availability_zone = var.az2
  vpc_id = aws_vpc.spoke1.id
    tags = {
    Name = join("-", ["spoke1", "snet", "pri", var.az2, var.spoke1_snet_cidr_pri_1b])
  }
}

resource "aws_subnet" "spoke1_tgwa_1a" {
  cidr_block = var.spoke1_snet_tgwa_1a
  availability_zone = var.az1
  vpc_id = aws_vpc.spoke1.id
    tags = {
    Name = join("-", ["spoke1", "snet", "tgwa", var.az1, var.spoke1_snet_tgwa_1a])
  }
}
resource "aws_subnet" "spoke1_tgwa_1b" {
  cidr_block = var.spoke1_snet_tgwa_1b
  availability_zone = var.az2
  vpc_id = aws_vpc.spoke1.id
    tags = {
    Name = join("-", ["spoke1", "snet", "tgwa", var.az2, var.spoke1_snet_tgwa_1b])
  }
}


