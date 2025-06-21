
##############################
# VPC and Subnet Creation
##############################
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
  vpc_id            = aws_vpc.custom.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name   = "Subnet-Custom-VPC"
    Access = "private"
  }
}

resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.custom.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1b"

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

##############################
# Security Group
##############################

# 1. Source Security Group from where the traffic will be allowed.
# 2. Compliant security:
#   - Inbound rules must be defined.
# 3. Non-Compliant security:
#   - Inbound rules must be defined.

resource "aws_security_group" "source" {
  name        = "source-sg"
  description = "Security group where the traffic is allowed into the DB."
  vpc_id      = aws_vpc.custom.id
}

resource "aws_security_group" "Compliant" {
  name        = "Compliant-sg"
  description = "Security group with compliant rules."
  vpc_id      = aws_vpc.custom.id
}

resource "aws_vpc_security_group_ingress_rule" "db" {
  security_group_id            = aws_security_group.Compliant.id
  referenced_security_group_id = aws_security_group.source.id
  ip_protocol                  = "tcp"
  from_port                    = 5432
  to_port                      = 5432
}

resource "aws_security_group" "NonCompliant" {
  name        = "NonCompliant-sg"
  description = "Security group with non-compliant rules."
  vpc_id      = aws_vpc.custom.id
}


resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.NonCompliant.id
  ip_protocol       = "tcp"
  from_port         = 443
  to_port           = 443
  cidr_ipv4         = "0.0.0.0/0"
}