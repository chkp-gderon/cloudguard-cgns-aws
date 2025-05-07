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
 variable "allowed_cp_hosts" {
   type = list(string)
}
variable "rfc1918" {
  type = list(string)
  default = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
}
variable "testing_nets" {
  type = list (string)
  default = [ "198.18.0.0/15" ]
}