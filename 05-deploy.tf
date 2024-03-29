resource "null_resource" "servidor" {
  triggers = {
    ip_address = aws_instance.server.public_ip
  }

  connection {
    type        = "ssh"
    user        = var.user-ec2
    private_key = file("~/.ssh/id_rsa")
    host        = aws_instance.server.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install git -y",
      "[ ! -d '/home/${var.user-ec2}/projetos' ] && mkdir '/home/${var.user-ec2}/projetos'",
      "cd '/home/${var.user-ec2}/projetos'",
      "git clone https://github.com/nettaskjr/services.git",
      "cd services",
      "chmod +x *.sh",
      "sudo ./00-run.sh '${var.client}' '${var.host}' '${var.user-ec2}' '${var.email}' ${var.apps}",
    ]
  }

  depends_on = [
    aws_route53_record.A
  ]
}