resource "aws_route53_record" "A" {
  zone_id = "${var.zone_id}"
  name    = "${var.host}" # sem o www
  type    = "A"
  ttl     = "300"
  records = [aws_instance.server.public_ip]
}

resource "aws_route53_record" "www" {
  zone_id = "${var.zone_id}"
  name    = "www" # WWW tb
  type    = "CNAME"
  ttl     = "300"
  records = [var.host]
}