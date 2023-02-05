// provider
provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_s3_bucket" "b" {
  bucket = "${var.host}-bucket"

  tags = {
    Client = "${var.client}"
    Name   = "${var.client}-BUCKET"
  }
}

resource "aws_s3_bucket_acl" "b" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_b" {
  bucket = aws_s3_bucket.b.id
  versioning_configuration {
    status = "Enabled"
  }
}
