resource "aws_s3_bucket" "data_bucket" {
  bucket = "infra-demo-s3-${random_id.suf.hex}"
  acl    = "private"
}
