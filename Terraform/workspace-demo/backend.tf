terraform {
    backend "s3" {
        bucket = "ctl-terraform-state-ap-south-1"
        key = "workspace-demo/dev-state-file"
        region = "ap-south-1"
        dynamodb_table = "terraform-state"
      
    }
}