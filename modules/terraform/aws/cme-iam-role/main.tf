# provider "aws" {
#   # region = var.region
#   # access_key = var.access_key
#   # secret_key = var.secret_key
# }

resource "aws_iam_role" "cme_iam_role" {
  assume_role_policy = data.aws_iam_policy_document.cme_role_assume_policy_document.json
  path = "/"
}

data "aws_iam_policy_document" "cme_role_assume_policy_document" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type = var.trusted_account == "" ? "Service" : "AWS"
      identifiers = var.trusted_account == "" ? ["ec2.amazonaws.com"] : [var.trusted_account]
    }
  }
}

locals {
  provided_sts_roles = length(var.sts_roles) == 0 ? 0 : 1
  allow_read_permissions = var.permissions == "Create with read-write permissions" || var.permissions == "Create with read permissions" ? 1 : 0
  allow_write_permissions = var.permissions == "Create with read-write permissions" ? 1 : 0
}

data "aws_iam_policy_document" "cme_role_sts_policy_doc" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    actions = ["sts:AssumeRole"]
    resources = var.sts_roles
  }
}
resource "aws_iam_policy" "cme_role_sts_policy" {
  count = local.provided_sts_roles
  policy = data.aws_iam_policy_document.cme_role_sts_policy_doc.json

}
resource "aws_iam_role_policy_attachment" "attach_sts_policy" {
  count = local.provided_sts_roles
  policy_arn = aws_iam_policy.cme_role_sts_policy[0].arn
  role = aws_iam_role.cme_iam_role.id
}

data "aws_iam_policy_document" "cme_role_read_policy_doc" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    actions = [
      "autoscaling:DescribeAutoScalingGroups",
      "ec2:DescribeRegions",
      "ec2:DescribeCustomerGateways",
      "ec2:DescribeInstances",
      "ec2:DescribeNetworkInterfaces",
      "ec2:DescribeRouteTables",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeSubnets",
      "ec2:DescribeTransitGateways",
      "ec2:DescribeTransitGatewayAttachments",
      "ec2:DescribeTransitGatewayRouteTables",
      "ec2:DescribeVpcs",
      "ec2:DescribeVpnGateways",
      "ec2:DescribeVpnConnections",
      "ec2:GetTransitGatewayAttachmentPropagations",
      "elasticloadbalancing:DescribeLoadBalancers",
      "elasticloadbalancing:DescribeTags",
      "elasticloadbalancing:DescribeListeners",
      "elasticloadbalancing:DescribeTargetGroups",
      "elasticloadbalancing:DescribeRules",
      "elasticloadbalancing:DescribeTargetHealth"]
    resources = ["*"]
  }
}
resource "aws_iam_policy" "cme_role_read_policy" {
  count = local.allow_read_permissions
  policy = data.aws_iam_policy_document.cme_role_read_policy_doc.json
}
resource "aws_iam_role_policy_attachment" "attach_read_policy" {
  count = local.allow_read_permissions
  policy_arn = aws_iam_policy.cme_role_read_policy[0].arn
  role = aws_iam_role.cme_iam_role.id
}

data "aws_iam_policy_document" "cme_role_write_policy_doc" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    actions = [
      "ec2:AssociateTransitGatewayRouteTable",
      "ec2:AttachVpnGateway",
      "ec2:CreateCustomerGateway",
      "ec2:CreateVpnConnection",
      "ec2:CreateVpnGateway",
      "ec2:DeleteCustomerGateway",
      "ec2:DeleteVpnConnection",
      "ec2:DeleteVpnGateway",
      "ec2:DetachVpnGateway",
      "ec2:DisableTransitGatewayRouteTablePropagation",
      "ec2:DisableVgwRoutePropagation",
      "ec2:DisassociateTransitGatewayRouteTable",
      "ec2:EnableTransitGatewayRouteTablePropagation",
      "ec2:EnableVgwRoutePropagation"]
    resources = ["*"]
  }
  statement {
    effect = "Allow"
    actions = [
      "cloudformation:DescribeStacks",
      "cloudformation:DescribeStackResources",
      "cloudformation:ListStacks"]
    resources = ["*"]
  }
  statement {
    effect = "Allow"
    actions = [
      "cloudformation:CreateStack",
      "cloudformation:DeleteStack"]
    resources = ["arn:aws:cloudformation:*:*:stack/vpn-by-tag--*/*"]
  }
}
resource "aws_iam_policy" "cme_role_write_policy" {
  count = local.allow_write_permissions
  policy = data.aws_iam_policy_document.cme_role_write_policy_doc.json
}
resource "aws_iam_role_policy_attachment" "attach_write_policy" {
  count = local.allow_write_permissions
  policy_arn = aws_iam_policy.cme_role_write_policy[0].arn
  role = aws_iam_role.cme_iam_role.id
}
resource "aws_iam_instance_profile" "iam_instance_profile" {
  role = aws_iam_role.cme_iam_role.id
}