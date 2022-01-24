terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.8"
    }
  }
}

provider "aws"{
    region = "ap-south-1"
}