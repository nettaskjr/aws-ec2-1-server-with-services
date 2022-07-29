// subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_cidr
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = "true" // indica que as maq iniciadas nessa subnet receberão ip público

  tags = {
    Client = "${var.client}"
    Name   = "${var.client}-PUBLIC"
  }
}

// route table
resource "aws_route_table" "rtb_public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Client = "${var.client}"
    Name   = "${var.client}-RTB-PUBLIC"
  }
}

// associate route table
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.rtb_public.id
}