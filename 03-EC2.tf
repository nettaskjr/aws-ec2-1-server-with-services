resource "aws_instance" "server" {
  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  vpc_security_group_ids = [aws_security_group.server.id]
  subnet_id              = aws_subnet.public.id
  key_name               = aws_key_pair.acesso.id

  tags = {
    Client = "${var.client}"
    Name   = "${var.client}-EC2-SERVER"
  }
}
