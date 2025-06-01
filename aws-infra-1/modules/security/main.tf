resource "aws_security_group" "default_restricted" {
  name        = "restricted-sg"
  description = "SG cerrado por defecto"
  vpc_id      = var.vpc_id

  ingress = []
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "restricted-sg"
  }
}

resource "aws_s3_bucket" "secure_bucket" {
  bucket = "secure-bucket-${random_id.bucket_id.hex}"
  acl    = "private"

  tags = {
    Name = "secure-bucket"
  }
}

resource "random_id" "bucket_id" {
  byte_length = 4
}

resource "aws_s3_bucket_public_access_block" "secure_bucket_block" {
  bucket = aws_s3_bucket.secure_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
