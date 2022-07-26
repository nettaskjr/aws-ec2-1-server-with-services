// provider
provider "aws" {
  region     = "${var.region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

// Importa a Chave Publica SSH para a aws
resource "aws_key_pair" "acesso" {
  key_name   = "chave-acesso-ssh"
  public_key = file("~/.ssh/id_rsa.pub")
}