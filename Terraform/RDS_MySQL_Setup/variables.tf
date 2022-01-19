variable "name" {
  description = "The DB name to create"
  default     = "RDS_terraform_demo"
}

variable "username" {
  description = "Username for the master DB user"
  type        = string
  default     = "devops"
}

variable "password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file"
  type        = string
  default     = "CTLnov2022"
}

variable "instance_class" {
  description = "DB class"
  type        = string
  default     = "db.t3.micro"
}

variable "engine_version" {
  description = "DB engine version"
  type        = string
  default     = "5.7"
}

variable "engine" {
  description = "DB engine"
  default     = "mysql"
}

variable "storage" {
  description = "RDS storage"
  default     = "20"
}

variable "identifier" {
  description = "RDS identifier"
  default     = "terraform-demo"
}