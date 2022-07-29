// vpc
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Client = "${var.client}"
    Name   = "${var.client}-VPC"
  }
}

// internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Client = "${var.client}"
    Name   = "${var.client}-IGW"
  }
}