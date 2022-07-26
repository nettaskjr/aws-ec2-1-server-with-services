# Criação de uma instância EC2 na AWS

Projeto de infra com criação de apenas uma instância EC2

## Instalação do Terraform (instale como root):

`vs="1.2.5" && arquivo="terraform_${vs}_linux_amd64.zip" && wget -c -P "/tmp" "https://releases.hashicorp.com/terraform/${vs}/${arquivo}" && cd /tmp && unzip ${arquivo} && mv terraform "/usr/local/bin"`

## Requisitos

- crie a chave pública em seu computador (ela será importada para a aws automaticametne):

`$ ssh-keygen -t rsa`

- crie o arquivo `terraform.tfvars` e inclua as variáveis abaixo:

`access_key = "sua access_key da aws"`

`secret_key = "sua secret_key da aws"`

`client     = "nome do cliente que será informado nas tags"`

`host       = "mome do host que será cadastrado no 53"`

`zone_id    = "id da zona criada no 53"`

Caso não crie este arquivo, as variáveis serão solicitadas na execução

## Execução do script

- Iniciar o terraform (alocar os recursos para o incio do processo, este procedimento é necessário apenas na primeira execução)

`$ terraform init`

- Planejar a execucao

`$ terraform plan`

- Enviar a execucao para a plataforma 

`$ terraform apply --auto-approve`

- Para excluir a infra criada

`$ terraform destroy --auto-approve`
