data "aws_vpc" "default" {
  default = true
}

resource "aws_vpc" "custom" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Custom VPC Project 04"
  }
}

resource "aws_subnet" "allowed" {
  vpc_id     = aws_vpc.custom.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "Subnet-Custom-VPC"
  }
}

resource "aws_subnet" "denied" {
  vpc_id     = data.aws_vpc.default.id
  cidr_block = "172.31.128.0/24"


  tags = {
    Name = "Subnet-Default-VPC"
  }
}