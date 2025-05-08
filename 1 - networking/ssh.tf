resource "aws_key_pair" "this" {
  key_name = join("-", [var.ssh_key_name, var.region])
  public_key = var.ssh_key_public
}

output "ssh_key_name" {
  value = aws_key_pair.this.key_name
}