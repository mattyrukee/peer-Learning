provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "bad_sg" {
  name        = "open-sg"
  description = "Allow all traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_s3_bucket" "bad_bucket" {
  bucket = "insecure-pci-bucket-example"
  acl    = "public-read"
}
