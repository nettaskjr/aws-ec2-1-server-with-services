resource "aws_security_group" "server" {
  name        = "${var.client}-SERVER-SG"
  description = "Liberar acesso publico SERVER"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 443 #TLS from VPC
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22 #ssh - tirar depois dos testes
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80 #http - aceitar apenas do load balancer
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0 # saida liberada
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Client = "${var.client}"
    Name   = "${var.client}-SERVER-SG"
  }
}