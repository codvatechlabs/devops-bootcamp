resource "aws_s3_bucket" "bucket" {
  bucket = "ctl-static-website-demo"
  acl    = "public-read"
  policy = file("policy.json")

  tags = {
    Name       = "S3-Static-Website"
    Created_By = "Terraform"
  }
  versioning {
    enabled = true
  }

  logging {
    target_bucket = aws_s3_bucket.log_bucket.id
    target_prefix = "log/"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
 }

   website {
    index_document = "index.html"
    error_document = "error.html"
  }

}