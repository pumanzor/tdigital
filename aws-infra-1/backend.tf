terraform {
  backend "s3" {
    bucket         = "test1tdigital"
    key            = "path/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}
