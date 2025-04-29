variable "region" {
  type = string
}
variable "az1" {
  type = string
}
variable "az2" {
  type = string
}
variable "AWS_ACCESS_KEY_ID" {
  type = string
  sensitive = true
}
variable "AWS_SECRET_ACCESS_KEY" {
  type = string
  sensitive = true
}
variable "AWS_SESSION_TOKEN" {
  type = string
  sensitive = true
}
variable "allowed_external_hosts" {
  type = list(string)
}
variable "rfc1918" {
  type = list (string) 
  default = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
}

variable "spoke1_vpc_cidr" {
  type = string
}
variable "spoke1_snet_cidr_pub_1a" {
  type = string
}
variable "spoke1_snet_cidr_pub_1b" {
  type = string
}
variable "spoke1_snet_cidr_pri_1a" {
  type = string
}
variable "spoke1_snet_cidr_pri_1b" {
  type = string
}

variable "spoke2_vpc_cidr" {
  type = string
}
variable "spoke2_snet_cidr_pub_1a" {
  type = string
}
variable "spoke2_snet_cidr_pub_1b" {
  type = string
}
variable "spoke2_snet_cidr_pri_1a" {
  type = string
}
variable "spoke2_snet_cidr_pri_1b" {
  type = string
}


variable "security_vpc_cidr" {
  type = string
}
variable "sec_snet_cidr_tgwa_1a" {
  type = string
}
variable "sec_snet_cidr_tgwa_1b" {
  type = string
}
variable "sec_snet_cidr_gwlbe_1a" {
  type = string
}
variable "sec_snet_cidr_gwlbe_1b" {
  type = string
}
variable "sec_snet_cidr_natgw_1a" {
  type = string
}
variable "sec_snet_cidr_natgw_1b" {
  type = string
}
variable "sec_snet_cidr_cp_1a" {
  type = string
}
variable "sec_snet_cidr_cp_1b" {
  type = string
}
