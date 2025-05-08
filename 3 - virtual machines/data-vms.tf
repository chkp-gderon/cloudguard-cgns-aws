data "aws_ami" "windows-2022" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["Windows_Server-2022-English-Full-Base*"]
  }
}

data "aws_ami" "windows-2025" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "image-id"
    values = ["ami-0b92e1cd3a91943aa"]
  }
}

data "aws_ami" "lamp" {
  most_recent = true

  filter {
    name   = "name"
    values = ["bitnami-lamp*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ami" "ubuntu_latest" {
  most_recent = true
  owners      = ["amazon"]  
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20250305"]
#    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20231207"]
  }
  filter {
    name = "architecture"
    values = ["x86_64"]
  }
}

