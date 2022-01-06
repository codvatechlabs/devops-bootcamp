resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = var.aws_s3_bucket_name
  acl    = "public-read"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
