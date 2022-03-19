variable "ami_id" {
  type    = string
  default = "ami-052cef05d01020f1d"
}

variable "lb_security_group_name" {
  type    = string
  default = "module-demo-lb-http-sg"
}

variable "asg_security_group_name" {
  type    = string
  default = "module-demo-asg-http-sg"
}

variable "instance_type" {
  type    = string
  default = "t2.small"
}

variable "key_name" {
  type    = string
  default = "devops2022"
}

variable "lb_name" {
  type    = string
  default = "module-lb-dashboard"
}

variable "asg_name" {
  type    = string
  default = "module-asg-dashboard"
}

variable "min_size" {
  type    = string
  default = "1"
}

variable "max_size" {
  type    = string
  default = "1"
}

variable "desired_capacity" {
  type    = string
  default = "1"
}
