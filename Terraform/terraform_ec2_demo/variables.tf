variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ami_id" {
  type    = string
  default = "ami-04893cdb768d0f9ee"

}

variable "key_name" {
  type    = string
  default = "devops2022"
}