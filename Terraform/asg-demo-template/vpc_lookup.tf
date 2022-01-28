data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["main"]
  }
}

data "aws_subnet_ids" "selected" {
  vpc_id = data.aws_vpc.selected.id
}

