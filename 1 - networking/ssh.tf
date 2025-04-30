resource "aws_key_pair" "this" {
  key_name = join("-", [var.ssh_key_name, var.region])
  public_key = var.ssh_key_public
}