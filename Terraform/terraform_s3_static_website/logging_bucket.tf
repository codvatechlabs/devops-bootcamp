# Setup Logging Bucket

resource "aws_s3_bucket" "log_bucket" {
  bucket = "logs-ctl-static-website-demo"
}




