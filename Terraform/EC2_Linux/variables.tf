variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ami_id" {
  type    = string
  default = "ami-052cef05d01020f1d"
}

variable "volume_type" {
  type    = string
  default = "gp2"
}

variable "volume_size" {
  type    = string
  default = "10"
}

variable "ec2_key_name" {
  type    = string
  default = "terraform"
}

variable "subnet_name" {
  type    = string
  default = "subnet-6f19ee04"
}

variable "tag_values" {
  type = map(any)
  default = {
    "Name"             = "Linux_Terraform_Demo",
    "Created_By"       = "Terraform_Automation",
    "Application_Name" = "Terraform_Demo"
  }
}
