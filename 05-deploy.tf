resource "null_resource" "servidor" {
  triggers = {
    ip_address = aws_instance.server.public_ip
  }

  connection {
    type        = "ssh"
    user        = "${var.user-ec2}"
    private_key = file("~/.ssh/id_rsa")
    host        = aws_instance.server.public_ip
  }

  # provisioner "file" {
  #     source = "services/"
  #     destination = "/tmp/"
  # }

  # provisioner "remote-exec" {
  #     inline = [
  #         "sudo chmod +x /tmp/pre-req.sh",
  #         "/tmp/pre-req.sh",
  #     ]
  # }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install git -y",
      dinstall = "/home/${var.user-ec2}/projetos"
      [ ! -d "${dinstall}" ] && mkdir "${dinstall}"
      "cd '${dinstall}'",
      "git clone https://github.com/nettaskjr/services.git",
      "cd services",
      "chmod +x *.sh",
      "sudo ./00-run.sh '${var.client}' '${var.host}' '${var.user-ec2}' ${var.apps}",
    ]
  }

  depends_on = [
    aws_route53_record.A
  ]
}