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


resource "aws_security_group" "ssh_access" {
  name        = "ec2-ssh-access"
  description = "Permite acceso SSH desde IP pública definida"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH desde IP pública permitida"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2-ssh-access"
  }
}


resource "random_id" "bucket_id" {
  byte_length = 4
}

resource "aws_s3_bucket" "secure_bucket" {
  bucket = "secure-bucket-${random_id.bucket_id.hex}"
  acl    = "private"

  tags = {
    Name = "secure-bucket"
  }
}

resource "aws_s3_bucket_public_access_block" "secure_bucket_block" {
  bucket = aws_s3_bucket.secure_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
