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

variable "versioning" {
  description = "Indica se haverá (Enabled) ou não (Disabled) o versionamento no bucket"
}
################################################################################

variable "region" {
  default = "us-east-1"
}
