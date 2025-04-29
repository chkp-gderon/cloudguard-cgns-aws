resource "aws_vpc" "security" {
  cidr_block = var.security_vpc_cidr
  tags = {
    Name = join("-", ["security", var.region, var.security_vpc_cidr])
  }
}

resource "aws_subnet" "sec_snet_tgw_1a" {
  cidr_block = var.sec_snet_cidr_tgwa_1a
  availability_zone = var.az1
  vpc_id = aws_vpc.security.id
    tags = {
    Name = join("-", ["sec", "snet", "tgwa", var.az1, var.sec_snet_cidr_tgwa_1a])
  }
}
resource "aws_subnet" "sec_snet_tgw_1b" {
  cidr_block = var.sec_snet_cidr_tgwa_1b
  availability_zone = var.az2
  vpc_id = aws_vpc.security.id
    tags = {
    Name = join("-", ["sec", "snet", "tgwa", var.az2, var.sec_snet_cidr_tgwa_1b])
  }
}
resource "aws_subnet" "sec_snet_gwlbe_1a" {
  cidr_block = var.sec_snet_cidr_gwlbe_1a
  availability_zone = var.az1
  vpc_id = aws_vpc.security.id
    tags = {
    Name = join("-", ["sec", "snet", "gwlbe", var.az1, var.sec_snet_cidr_gwlbe_1a])
  }
}
resource "aws_subnet" "sec_snet_gwlbe_1b" {
  cidr_block = var.sec_snet_cidr_gwlbe_1b
  availability_zone = var.az2
  vpc_id = aws_vpc.security.id
    tags = {
    Name = join("-", ["sec", "snet", "gwlbe", var.az2, var.sec_snet_cidr_gwlbe_1b])
  }
}
resource "aws_subnet" "sec_snet_natgw_1a" {
  cidr_block = var.sec_snet_cidr_natgw_1a
  availability_zone = var.az1
  vpc_id = aws_vpc.security.id
    tags = {
    Name = join("-", ["sec", "snet", "natgw", var.az1, var.sec_snet_cidr_natgw_1a])
  }
}
resource "aws_subnet" "sec_snet_natgw_1b" {
  cidr_block = var.sec_snet_cidr_natgw_1b
  availability_zone = var.az2
  vpc_id = aws_vpc.security.id
    tags = {
    Name = join("-", ["sec", "snet", "natgw", var.az2, var.sec_snet_cidr_natgw_1b])
  }
}
resource "aws_subnet" "sec_snet_cp_1a" {
  cidr_block = var.sec_snet_cidr_cp_1a
  availability_zone = var.az1
  vpc_id = aws_vpc.security.id
    tags = {
    Name = join("-", ["sec", "snet", "cp", var.az1, var.sec_snet_cidr_cp_1a])
  }
}
resource "aws_subnet" "sec_snet_cp_1b" {
  cidr_block = var.sec_snet_cidr_cp_1b
  availability_zone = var.az2
  vpc_id = aws_vpc.security.id
    tags = {
    Name = join("-", ["sec", "snet", "cp", var.az2, var.sec_snet_cidr_cp_1b])
  }
}

