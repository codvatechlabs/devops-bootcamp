provider "aws" {
    region = "ap-south-1"
}

resource "aws_s3_bucket" "s3_tutorials" {
  bucket = "ctl-tf-test-bucket"

  tags = {
    Name        = "Created_By_Terraform"
    Environment = "Dev"
  }
}