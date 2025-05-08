module  "sms" {
    source = "..\\modules\\terraform\\aws\\management"
   // --- VPC Network Configuration ---
    vpc_id = aws_vpc.access1.id
    subnet_id = aws_subnet.access1_pub_1a.id
    
    // --- EC2 Instances Configuration ---
    management_name = "CP-Management-tf"
    management_instance_type = "m5.xlarge"
    key_name = aws_key_pair.this.key_name
    allocate_and_associate_eip = true
    volume_size = 100
    volume_encryption = "alias/aws/ebs"
    enable_instance_connect = true
    disable_instance_termination = false
    instance_tags = {
    key1 = "value1"
    key2 = "value2"
    }
    
    // --- IAM Permissions ---
    iam_permissions = "Create with read-write permissions"
    predefined_role = ""
    sts_roles = []
    metadata_imdsv2_required = true
    
    // --- Check Point Settings ---
    management_version = "R82-BYOL"
    admin_shell = "/bin/bash"
    management_password_hash = ""
    management_maintenance_mode_password_hash = var.gw_maint_hash  # For R81.10 and below the management_password_hash is used also as maintenance-mode password.
    // --- Security Management Server Settings ---
    management_hostname = "mgmt-tf"
    management_installation_type = "Primary management"
    SICKey = ""
    allow_upload_download = "true"
    gateway_management = "Over the internet"
    admin_cidr = "0.0.0.0/0"
    gateway_addresses = "0.0.0.0/0"
    primary_ntp = ""
    secondary_ntp = ""
    management_bootstrap_script = "echo 'this is bootstrap script' > /home/admin/bootstrap.txt"
    nsg_ids = [aws_security_group.sms1.id, aws_security_group.sms2.id ]
 }


 resource "aws_security_group" "sms1" {
   vpc_id = aws_vpc.access1.id
   name = join("-" ,["SMS", "NSG1", var.region])
     ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
     prefix_list_ids = [aws_ec2_managed_prefix_list.this.id]
  }
     ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = var.rfc1918
  }
#    cidr_blocks = concat(var.allowed_cp_hosts,  var.rfc1918, var.testing_nets)

#      ingress {
#     from_port = 257
#     to_port = 257
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   ingress {
#     from_port = 18191
#     to_port = 18191
#     protocol = "tcp"
#    # cidr_blocks = concat(var.allowed_external_hosts,  var.rfc1918, var.testing_nets)
#     prefix_list_ids = [aws_ec2_managed_prefix_list.this.id]
#   }
#   ingress {
#     from_port = 18192
#     to_port = 18192
#     protocol = "tcp"
#     prefix_list_ids = [aws_ec2_managed_prefix_list.this.id]
# #    cidr_blocks = concat(var.allowed_cp_hosts,  var.rfc1918, var.testing_nets)
#   }
#   ingress {
#     from_port = 18208
#     to_port = 18208
#     protocol = "tcp"
#      prefix_list_ids = [aws_ec2_managed_prefix_list.this.id]
# #   cidr_blocks = concat(var.allowed_cp_hosts,  var.rfc1918, var.testing_nets)
#   }
#   ingress {
#     from_port = 18210
#     to_port = 18210
#     protocol = "tcp"
#      prefix_list_ids = [aws_ec2_managed_prefix_list.this.id]
# #   cidr_blocks = concat(var.allowed_cp_hosts,  var.rfc1918, var.testing_nets)
#   }
#   ingress {
#     from_port = 18211
#     to_port = 18211
#     protocol = "tcp"
#      prefix_list_ids = [aws_ec2_managed_prefix_list.this.id]
# #   cidr_blocks = concat(var.allowed_cp_hosts,  var.rfc1918, var.testing_nets)
#   }
#   ingress {
#     from_port = 18221
#     to_port = 18221
#     protocol = "tcp"
#      prefix_list_ids = [aws_ec2_managed_prefix_list.this.id]
# #   cidr_blocks = concat(var.allowed_cp_hosts,  var.rfc1918, var.testing_nets)
#   }
#   ingress {
#     from_port = 18264
#     to_port = 18264
#     protocol = "tcp"
#      prefix_list_ids = [aws_ec2_managed_prefix_list.this.id]
# #   cidr_blocks = concat(var.allowed_cp_hosts,  var.rfc1918, var.testing_nets)
#   }

#   ingress {
#     from_port = 22
#     to_port = 22
#     protocol = "tcp"
#      prefix_list_ids = [aws_ec2_managed_prefix_list.this.id]
# #   cidr_blocks = concat(var.allowed_cp_hosts,  var.rfc1918, var.testing_nets)
#   }
#   ingress {
#     from_port = 443
#     to_port = 443
#     protocol = "tcp"
#      prefix_list_ids = [aws_ec2_managed_prefix_list.this.id]
# #   cidr_blocks = concat(var.allowed_cp_hosts,  var.rfc1918, var.testing_nets)
#   }
#   ingress {
#     from_port = 18190
#     to_port = 18190
#     protocol = "tcp"
#      prefix_list_ids = [aws_ec2_managed_prefix_list.this.id]
# #   cidr_blocks = concat(var.allowed_cp_hosts,  var.rfc1918, var.testing_nets)
#   }
#   ingress {
#     from_port = 19009
#     to_port = 19009
#     protocol = "tcp"
#      prefix_list_ids = [aws_ec2_managed_prefix_list.this.id]
# #   cidr_blocks = concat(var.allowed_cp_hosts,  var.rfc1918, var.testing_nets)
#   }
#   ingress {
#     from_port = 3389
#     to_port = 3389
#     protocol = "tcp"
#      prefix_list_ids = [aws_ec2_managed_prefix_list.this.id]
# #   cidr_blocks = concat(var.allowed_cp_hosts,  var.rfc1918, var.testing_nets)
#   }
#     ingress {
#     from_port = 3389
#     to_port = 3389
#     protocol = "udp"
#      prefix_list_ids = [aws_ec2_managed_prefix_list.this.id]
# #   cidr_blocks = concat(var.allowed_cp_hosts,  var.rfc1918, var.testing_nets)
#   }

     egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  } 
}
output "management_public_ip" {
  value = module.sms.management_public_ip
}
 resource "aws_security_group" "sms2" {
   vpc_id = aws_vpc.access1.id
   name = join("-" ,["SMS", "NSG2", var.region])
       ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
     prefix_list_ids = [aws_ec2_managed_prefix_list.this.id]
  }
#   ingress {
#     from_port = 22
#     to_port = 22
#     protocol = "tcp"
#      prefix_list_ids = [aws_ec2_managed_prefix_list.this.id]
# #   cidr_blocks = concat(var.allowed_external_hosts)
#   }
#   ingress {
#     from_port = 443
#     to_port = 443
#     protocol = "tcp"
#      prefix_list_ids = [aws_ec2_managed_prefix_list.this.id]
# #   cidr_blocks = concat(var.allowed_external_hosts)
#   }
#   ingress {
#     from_port = 3389
#     to_port = 3389
#     protocol = "-1"
#      prefix_list_ids = [aws_ec2_managed_prefix_list.this.id]
# #    cidr_blocks = concat(var.allowed_external_hosts)
#   }
   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  } 
}
# resource "aws_vpc_peering_connection" "acc_to_security" {
#   vpc_id = aws_vpc.access1.id
#   peer_vpc_id = module.cp_tgw_gwlb_asg.vpc_id
#   auto_accept = true
# }

output "nsg1_id" {
  value = aws_security_group.sms1.id
}
output "nsg2_id" {
  value = aws_security_group.sms2.id
}