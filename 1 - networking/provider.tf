# Configure the AWS Provider
provider "aws" {
  region = var.region
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
  token = var.AWS_SESSION_TOKEN
}

terraform {
  required_version = ">= 0.14.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.20.0"
    }
    http = {
      version = "~> 3.4.0"
    }
    random = {
      version = "~> 3.5.1"
    }
  }
}
