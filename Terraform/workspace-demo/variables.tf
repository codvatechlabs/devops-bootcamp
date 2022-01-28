variable "security_group_name" {
  type    = map
  default = {
     "default" = "default-workspace-sg"
     "dev"     = "dev-workspsace-sg"
     "qa"      = "dev-workspace-qa"
  }
}

variable "instance_type" {
  type    = map
  default = {
     "default" = "t2.small"
     "dev"     = "t2.micro"
     "qa"      = "t2.medium"
  }
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
  default = "devops2022"
}

variable "subnet_name" {
  type    = string
  default = "subnet-6f19ee04"
}

variable "tag_values" {
  type = map(any)
  default = {
    "Name"             = "ec2-tf-demo",
    "Created_By"       = "Terraform_Automation",
    "Application_Name" = "Terraform_Demo"
  }
}
