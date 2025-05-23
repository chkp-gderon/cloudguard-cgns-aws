region = "eu-west-1"
az1 = "eu-west-1a"
az2 = "eu-west-1b"
# allowed_external_hosts = ["54.78.156.68/32", "108.129.170.72/32", "52.16.69.188/32"]  # /32 only
# allowed_cp_hosts = [ "109.145.189.50/32" ]  # /32 only

asg1 = "54.75.50.37/32"
asg2 = "18.201.146.182/32"
# asg3 = "/32"
# asg4 = "/32"

jonpainehome = "109.145.189.50/32"
rasmushome = "94.224.224.166/32"
geerthome = "77.33.182.50/32"

access1_vpc_cidr = "192.168.0.0/24"
access1_snet_cidr_pub_1a = "192.168.0.0/28"
access1_snet_cidr_pub_1b = "192.168.0.16/28"
access1_snet_cidr_pri_1a = "192.168.0.128/28"
access1_snet_cidr_pri_1b = "192.168.0.144/28"
access_snet_tgwa_1a = "192.168.0.112/28"
access_snet_tgwa_1b = "192.168.0.240/28"

spoke1_vpc_cidr = "192.168.1.0/24"
spoke1_snet_cidr_pub_1a = "192.168.1.0/28"
spoke1_snet_cidr_pub_1b = "192.168.1.16/28"
spoke1_snet_cidr_pri_1a = "192.168.1.128/28"
spoke1_snet_cidr_pri_1b = "192.168.1.144/28"
spoke1_snet_tgwa_1a = "192.168.1.112/28"
spoke1_snet_tgwa_1b = "192.168.1.240/28"

spoke2_vpc_cidr = "192.168.2.0/24"
spoke2_snet_cidr_pub_1a = "192.168.2.0/28"
spoke2_snet_cidr_pub_1b = "192.168.2.16/28"
spoke2_snet_cidr_pri_1a = "192.168.2.128/28"
spoke2_snet_cidr_pri_1b = "192.168.2.144/28"
spoke2_snet_tgwa_1a = "192.168.2.112/28"
spoke2_snet_tgwa_1b = "192.168.2.240/28"

security_vpc_cidr = "172.16.0.0/22" 
# sec_snet_cidr_tgwa_1a = "172.16.0.0/28"
# sec_snet_cidr_tgwa_1b = "172.16.0.128/28"
sec_snet_cidr_gwlbe_1a = "172.16.0.16/28"
sec_snet_cidr_gwlbe_1b = "172.16.0.144/28"
sec_snet_cidr_natgw_1a = "172.16.0.32/28"
sec_snet_cidr_natgw_1b = "172.16.0.160/28"
# sec_snet_cidr_cp_1a = "172.16.0.48/28"
# sec_snet_cidr_cp_1b = "172.16.0.176/28"

security2_vpc_cidr = "172.17.0.0/22" 
sec2_snet_cidr_tgwa_1a = "172.17.0.0/28"
sec2_snet_cidr_tgwa_1b = "172.17.0.128/28"
sec2_snet_cidr_gwlbe_1a = "172.17.0.16/28"
sec2_snet_cidr_gwlbe_1b = "172.17.0.144/28"
sec2_snet_cidr_natgw_1a = "172.17.0.32/28"
sec2_snet_cidr_natgw_1b = "172.17.0.160/28"
sec2_snet_cidr_cp_1a = "172.17.0.48/28"
sec2_snet_cidr_cp_1b = "172.17.0.176/28"

ingress1_vpc_cidr = "192.168.10.0/24"
ingress1_snet_cidr_pub_1a = "192.168.10.0/28"
ingress1_snet_cidr_pub_1b = "192.168.10.16/28"
ingress1_snet_cidr_gwlbe_1a = "192.168.10.32/28"
ingress1_snet_cidr_gwlbe_1b = "192.168.10.48/28"
ingress1_snet_cidr_pri_1a = "192.168.10.128/28"
ingress1_snet_cidr_pri_1b = "192.168.10.144/28"
ingress1_snet_tgwa_1a = "192.168.10.112/28"
ingress1_snet_tgwa_1b = "192.168.10.240/28"

gw_maint_hash = "grub.pbkdf2.sha512.10000.08F40DC2121466D79BFCDEAB626039FB3AE4EF4A90C881BEAD425F36C8BE951DD1855803A9AB59E4C64ABE4FA8F27E80B8898B8B51E2911687AB3916A7102F2A.F09202790BDAE31611760F8A2C2B3851873F6A02941BD3FB2A068824533D51A009441F3425489EBF3F5C6777F46524E392C6197E14B31593957BF16D759CAEC6"
tn_name = "tnEUW1R8120AWS01"
mn_name = "mnMgmt"
gw_prefix = "cp001"
gw_size = "c5.xlarge"
gw_version = "R81.20-BYOL"
