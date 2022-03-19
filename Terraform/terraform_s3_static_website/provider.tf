# Setup AWS Provider
provider "aws" {
  region = "ap-south-1"
}

terraform {
  required_providers {
    aws = "~> 3.74"
  }
}
