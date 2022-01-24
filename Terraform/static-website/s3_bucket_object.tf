resource "aws_s3_bucket_object" "oject" {
  for_each = fileset("/Users/nilesh/Documents/DevOps-BootCamp/Terrraform/HandsOn-Terraform/static-website/temp/", "*")
  bucket = "ctl-static-website-demo"
  key    = each.value
  content_type = "text/html"
  source = "/Users/nilesh/Documents/DevOps-BootCamp/Terrraform/HandsOn-Terraform/static-website/temp/${each.value}"
  # etag makes the file update when it changes; see https://stackoverflow.com/questions/56107258/terraform-upload-file-to-s3-on-every-apply
  etag   = filemd5("/Users/nilesh/Documents/DevOps-BootCamp/Terrraform/HandsOn-Terraform/static-website/temp/${each.value}")
}