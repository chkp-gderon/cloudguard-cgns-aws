region = "eu-west-1"
az1 = "eu-west-1a"
az2 = "eu-west-1b"
allowed_external_hosts = [""]

security_vpc_cidr = "172.16.0.0/22" 



spoke1_vpc_cidr = "192.168.1.0/24"
spoke1_snet_cidr_pub_1a = "192.168.1.0/28"
spoke1_snet_cidr_pub_1b = "192.168.1.16/28"
spoke1_snet_cidr_pri_1a = "192.168.1.128/28"
spoke1_snet_cidr_pri_1b = "192.168.1.144/28"


spoke2_vpc_cidr = "192.168.2.0/24"
spoke2_snet_cidr_pub_1a = "192.168.2.0/28"
spoke2_snet_cidr_pub_1b = "192.168.2.16/28"
spoke2_snet_cidr_pri_1a = "192.168.2.128/28"
spoke2_snet_cidr_pri_1b = "192.168.2.144/28"

sec_snet_cidr_tgwa_1a = "172.16.0.0/28"
sec_snet_cidr_tgwa_1b = "172.16.0.128/28"
sec_snet_cidr_gwlbe_1a = "172.16.0.16/28"
sec_snet_cidr_gwlbe_1b = "172.16.0.144/28"
sec_snet_cidr_natgw_1a = "172.16.0.32/28"
sec_snet_cidr_natgw_1b = "172.16.0.160/28"
sec_snet_cidr_cp_1a = "172.16.0.48/28"
sec_snet_cidr_cp_1b = "172.16.0.176/28"


