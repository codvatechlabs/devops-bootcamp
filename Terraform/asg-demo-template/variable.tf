variable "ami_id" {
  type    = string
  default = "ami-052cef05d01020f1d"
}

variable "security_group_name" {
  type    = string
  default = "dashboard-lb-http-sg"
}

variable "asg_security_group_name" {
  type    = string
  default = "dashboard-asg-http-sg"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type    = string
  default = "devops2022"
}