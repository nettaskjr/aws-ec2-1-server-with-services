output "ip_server" {
  value = aws_instance.server.public_ip
}

output "dns_server" {
  value = var.host
}

output "id_instancia" {
  value = aws_instance.server.id
}