module  "cp_tgw_gwlb_asg" {
    source = "..\\modules\\terraform\\aws\\tgw-gwlb-master"
    depends_on = [aws_key_pair.this]
    region = var.region
    // --- VPC Network Configuration ---
    vpc_cidr = var.security_vpc_cidr
    public_subnets_map = {
    "eu-west-1a" = 3
    "eu-west-1b" = 11
    }
    tgw_subnets_map = {
    "eu-west-1a" = 0
    "eu-west-1b" = 8
    }
    subnets_bit_length = 6
    
    availability_zones = ["eu-west-1a", "eu-west-1b"]
    number_of_AZs = 2
        
    nat_gw_subnet_1_cidr = var.sec_snet_cidr_natgw_1a
    nat_gw_subnet_2_cidr = var.sec_snet_cidr_natgw_1b
        
    gwlbe_subnet_1_cidr = var.sec_snet_cidr_gwlbe_1a
    gwlbe_subnet_2_cidr = var.sec_snet_cidr_gwlbe_1b
        
    // --- General Settings ---
    key_name = aws_key_pair.this.key_name
    enable_volume_encryption = true
    volume_size = 100
    enable_instance_connect = true
    disable_instance_termination = false
    allow_upload_download = true
    management_server = var.mn_name
    configuration_template = var.tn_name
    admin_shell = "/bin/bash"
        
    // --- Gateway Load Balancer Configuration ---
    gateway_load_balancer_name = join("-", ["cp", "gwlb", var.region])
    target_group_name = join("-", ["tg", var.region])
    enable_cross_zone_load_balancing = "true"
        
    // --- Check Point CloudGuard IaaS Security Gateways Auto Scaling Group Configuration ---
    gateway_name = join("-", [var.gw_prefix, var.region])
    gateway_instance_type = var.gw_size
    minimum_group_size = 0
    maximum_group_size = 10
    gateway_version = var.gw_version
    gateway_password_hash = var.gw_pw_hash
    gateway_maintenance_mode_password_hash = var.gw_maint_hash 
    gateway_SICKey = var.sic_key
    gateways_provision_address_type = "public"
    allocate_public_IP = true
    enable_cloudwatch = true
    gateway_bootstrap_script = "echo 'this is bootstrap script' > /home/admin/bootstrap.txt"
        
    // --- Check Point CloudGuard IaaS Security Management Server Configuration ---
    management_deploy = false
    management_instance_type = "m5.xlarge"
    management_version = "R81.20-BYOL"
    management_password_hash = ""
    management_maintenance_mode_password_hash = "" # For R81.10 and below the management_password_hash is used also as maintenance-mode password.
    gateways_policy = "Standard"
    gateway_management = "Locally managed"
    admin_cidr = "0.0.0.0/0"
    gateways_addresses = "0.0.0.0/0"
        
    // --- Other parameters ---
    volume_type = "gp3"
}

output "gwlb_arn" {
    value = module.cp_tgw_gwlb_asg.gwlb_arn
}
output "gwlb_service_name" {
    value = module.cp_tgw_gwlb_asg.gwlb_service_name
}
output "gwlbe_sec_1a" {
    value = module.cp_tgw_gwlb_asg.gwlbe1a_id
}
output "gwlbe_sec_1b" {
    value = module.cp_tgw_gwlb_asg.gwlbe1b_id
}
