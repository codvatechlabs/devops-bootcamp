resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "netflif1699"
  acl    = "public-read"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
