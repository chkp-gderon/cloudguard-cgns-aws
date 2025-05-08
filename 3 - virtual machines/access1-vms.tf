
# Create EC2 Windows Instance
resource "aws_instance" "access1_windows_server" {
  ami = data.aws_ami.windows-2025.id
  instance_type = var.windows_instance_type
  key_name = data.aws_key_pair.ssh_key.key_name
  user_data                   = templatefile("windows-user-data.ps1", {
    jonusername = var.jonusername, 
    jonpassword = var.jonpassword, 
    rasmususername = var.rasmususername, 
    rasmuspassword = var.rasmuspassword, 
    geertusername = var.geertusername, 
    geertpassword = var.geertpassword
    } 
  )
  get_password_data = true
  
  # root disk
  root_block_device {
    volume_size           = var.windows_root_volume_size
    volume_type           = var.windows_root_volume_type
    delete_on_termination = true
    encrypted             = true
  }
  # extra disk
  ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = var.windows_data_volume_size
    volume_type           = var.windows_data_volume_type
    encrypted             = true
    delete_on_termination = true
  }
    network_interface {
      network_interface_id = aws_network_interface.access1_win_eni.id
      device_index = 0
    }
    tags = merge(
    { Name = join("-", ["access", "windows_server", var.region]) },
    var.tags
  )
}
# Create Elastic IP for the EC2 instance
resource "aws_eip" "access1_windows_eip" {
  domain = "vpc"
  tags = merge(
    { Name = join(".", ["", "EIP", "windows_server", var.region]) },
    var.tags
  )
}
resource "aws_network_interface" "access1_win_eni" {
  subnet_id                   = data.aws_subnet.access1_pub_1a_id.id
  private_ips = [cidrhost(data.aws_subnet.access1_pub_1a_id.cidr_block, 10)]
  private_ips_count = 0
  source_dest_check           = false
  security_groups      = [aws_security_group.access_sg_all.id]
}


# Associate Elastic IP to Windows Server
resource "aws_eip_association" "access1_eip_association" {
  network_interface_id   = aws_network_interface.access1_win_eni.id
  allocation_id = aws_eip.access1_windows_eip.id
}

resource "aws_security_group" "access_sg_all" {
  name        = join("-", ["access1", var.region])
  description = "Testing SG"
  vpc_id      = data.aws_vpc.access1.id 
 
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    prefix_list_ids = [data.aws_ec2_managed_prefix_list.this.id]
#    cidr_blocks = concat(var.rfc1918, var.allowed_cp_hosts, var.allowed_external_hosts)
  }
  
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "access1_ubuntu" {
  ami                         = data.aws_ami.ubuntu_latest.id
  instance_type               = var.linux_instance_type
  key_name = data.aws_key_pair.ssh_key.key_name
  # user_data        =   "" //templatefile("wireguard-user-data-connector.sh", {
    # student_username = "dummy"
    # student_hash = var.instructor_password_hash
    # instructor_username = var.instructor_username
    # instructor_hash = var.instructor_password_hash 
    
    # network_id = perimeter81_network.p81_instructor.id
    # tunnel_id = perimeter81_wireguard.instructor_connectivity_wg.id
    # token = perimeter81_wireguard.instructor_connectivity_wg.request_config_token
    # addr4nat = aws_network_interface.instructor_wg_connectivity_eni.private_ip} )
  user_data   = ""      #         = templatefile("wireguard-user-data-connector.sh", {
    # student_username = "dummy"
    # student_hash = "dummy"
    # student_password = "dummy"
    # instructor_username = var.instructor_username
    # instructor_hash = var.instructor_password_hash 
    # instructor_password = var.instructor_password
    
    # addr4nat = aws_eip.eip_wg_instructor_connectivity.public_ip
    # network_id = "" // perimeter81_network.p81_instructor.id
    # tunnel_id = "" // perimeter81_wireguard.instructor_connectivity_wg.id
    # token = "" // perimeter81_wireguard.instructor_connectivity_wg.request_config_token
    # } )

  # root disk
  root_block_device {
    volume_size           = var.windows_root_volume_size
    volume_type           = var.windows_root_volume_type
    delete_on_termination = true
    encrypted             = true
  }
  # extra disk
  ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = var.windows_data_volume_size
    volume_type           = var.windows_data_volume_type
    encrypted             = true
    delete_on_termination = true
  }
    network_interface {
      network_interface_id = aws_network_interface.access1_ubuntu_eni.id
      device_index = 0
    }
  tags = merge(
    { Name = join(".", ["access",  "ubuntu", var.region]) },
    var.tags
  )
  # lifecycle {
  #   ignore_changes =  [tags ]
  # }
}

resource "aws_eip" "access1_ubuntu_eip" {

    domain = "vpc"
  tags = merge(
    { Name = join(".", ["access1", "EIP", "ubuntu", var.region]) },
    var.tags
  )
}
# Associate Elastic IP to Server
resource "aws_eip_association" "eipa_access1_ubuntu" {
  network_interface_id =  aws_network_interface.access1_ubuntu_eni.id
  allocation_id = aws_eip.access1_ubuntu_eip.id
}

resource "aws_network_interface" "access1_ubuntu_eni" {
  subnet_id                   = data.aws_subnet.access1_pub_1a_id.id
  private_ips = [cidrhost(data.aws_subnet.access1_pub_1a_id.cidr_block, 12)]
  private_ips_count = 0
  source_dest_check           = false
  security_groups      = [aws_security_group.access_sg_all.id]
}

