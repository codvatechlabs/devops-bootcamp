data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["main"]
  }
}

data "aws_subnets" "selected" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

