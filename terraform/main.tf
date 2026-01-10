provider "aws" {
  region = "us-east-1"
}

# Security group allowing all traffic (HIGH/CRITICAL)
resource "aws_security_group" "open_sg" {
  name        = "open-security-group"
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

# S3 bucket with public access (HIGH/CRITICAL)
resource "aws_s3_bucket" "public_bucket" {
  bucket = "insecure-public-bucket-test"
}

resource "aws_s3_bucket_public_access_block" "public_bucket" {
  bucket = aws_s3_bucket.public_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "public_bucket" {
  bucket = aws_s3_bucket.public_bucket.id
  acl    = "public-read"
}
