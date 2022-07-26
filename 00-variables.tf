##############################################################################
# dados alimentados via arquivo .tfvars, ou solicitado no inicio da execução #
##############################################################################

variable "access_key" {
  description = "Access key para acesso à AWS"
}

variable "secret_key" {
  description = "Secret key para acesso à AWS"
}

variable "client" {
  description = "Nome do cliente para informação nas tags"
}

# route 53 -----------------------
variable "host" {
  description = "Host publico da instância"
}

variable "zone_id" {
  description = "Zone do host"
}

variable "apps" {
  description = "Qual(is) apps serão instalados?"
}

################################################################################

variable "instance_type" {
  default = "t2.micro"
}

variable "region" {
  default = "us-east-1"
}

variable "ami" {
  default = "ami-09a41e26df464c548" # debian 11 oficial - 64bits (x86)
}

variable "user-ec2" {
  default = "admin" # para debian, caso seja outra distro favor mudar
}

# vpc ----------------------------
variable "vpc_cidr" {
  default = "192.168.0.0/16"
}

variable "public_cidr" {
  default = "192.168.1.0/24"
}
