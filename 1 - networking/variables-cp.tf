variable "mn_name" {
  type = string
  default = "mnMgmt"
}
variable "tn_name" {
  type = string 
}
variable "gw_prefix" {
  type = string
}
variable "gw_size" {
  type = string
}
variable "sic_key" {
  type = string
}
variable "gw_version" {
  type = string
}
variable "ssh_key_name" {
  type = string
  default = "AWS_SSH_KEY"
}
variable "ssh_key_public" {
  type = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJ29FITyCHKr/DPyZliI3rnV053kmPJKprNjEA7zUNvvX4HU5XnHFBznob95e0OoRLH7byrdtAVHELwqeEqdrafs2plnoh2u80Yrp+oTs88mN7E5I0OeWgqiMqiLrpK8nQCSxkIoV0KtgAkD0T8Ym6+e+frZUTcGLxBZuKegyWpVFky86iPN2KVCTd1dg/4JFClRHD8erE3tCZsDl2R7lHqTLgf/yLwepnu6YfV3qCbwvEchpswtGwF0OTj46QgvTBTN5jdphGXLdm94f1MShampOlcW3nskQ23eLnEf121TpYUNx72UwVM2dS9cf9AnJ2nHIiY/RWCACbAngCyUan rsa-key-20250429"
}
variable "gw_maint_hash" {
  type = string
}
variable "gw_pw_hash" {
  type = string
  default  = ""
}