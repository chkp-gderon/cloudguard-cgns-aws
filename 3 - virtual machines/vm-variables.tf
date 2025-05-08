variable "windows_instance_type" {
  type        = string
  description = "EC2 instance type for Windows Server"
  default     = "t3.2xlarge"
}
variable "linux_instance_type" {
  type        = string
  description = "EC2 instance type for Windows Server"
  default     = "t3.large"
}
variable "windows_associate_public_ip_address" {
  type        = bool
  description = "Associate a public IP address to the EC2 instance"
  default     = true
}
variable "windows_root_volume_size" {
  type        = number
  description = "Volumen size of root volumen of Windows Server"
  default     = "100"
}
variable "windows_data_volume_size" {
  type        = number
  description = "Volumen size of data volumen of Windows Server"
  default     = "100"
}
variable "windows_root_volume_type" {
  type        = string
  description = "Volumen type of root volumen of Windows Server."
  default     = "gp3"
}
variable "windows_data_volume_type" {
  type        = string
  description = "Volumen type of data volumen of Windows Server."
  default     = "gp3"
}
variable "jonusername" {
  type = string
  default = "jpaine"
}
variable "rasmususername" {
  type = string
  default = "rasmus"
}
variable "geertusername" {
  type = string
  default = "geert"
}
variable "jonpassword" {
  type = string
  sensitive = true 
}
variable "rasmuspassword" {
  type = string
  sensitive = true 
}
variable "geertpassword" {
  type = string
  sensitive = true 
}
