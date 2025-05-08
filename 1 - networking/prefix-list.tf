resource "aws_ec2_managed_prefix_list" "this" {
  name = join( "-", ["pl", "allow", var.region])
  address_family = "IPv4"
  max_entries = 25
  entry{
    cidr = var.geerthome
  }
  entry{
    cidr = var.jonpainehome
  }
  entry{
    cidr = var.rasmushome
  }
  entry {
    cidr = var.asg1
  }
  # entry {
  #   cidr = var.asg2
  # }
  # entry {
  #   cidr = var.asg3
  # }
  # entry {
  #   cidr = var.asg4
  # }
}

output "prefix_list_id" {
  value = aws_ec2_managed_prefix_list.this.id
}