data "aws_vpc" "default" {
  default = true
}

resource "aws_vpc" "custom" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Custom VPC Project 04"
  }
}

moved {
  from = aws_subnet.allowed
  to   = aws_subnet.private1
}

resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.custom.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name   = "Subnet-Custom-VPC"
    Access = "private"
  }
}


# The denied subnet is not needed anymore, but it is kept for documentation purposes.

resource "aws_subnet" "denied" {
  vpc_id     = data.aws_vpc.default.id
  cidr_block = "172.31.128.0/24"


  tags = {
    Name = "Subnet-Default-VPC"
  }
}