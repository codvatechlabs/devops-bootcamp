resource "aws_s3_bucket" "this" {
  bucket = var.aws_s3_bucket_name
  acl    = "public-read"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
