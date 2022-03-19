# Upload object in S3 Bucket 

resource "aws_s3_bucket_object" "oject" {
  for_each     = fileset("temp/", "*")
  bucket       = "ctl-static-website-demo"
  key          = each.value
  content_type = "text/html"
  source       = "temp/${each.value}"
  # etag makes the file update when it changes; see https://stackoverflow.com/questions/56107258/terraform-upload-file-to-s3-on-every-apply
  etag       = filemd5("temp/${each.value}")
  depends_on = [aws_s3_bucket.bucket]

}