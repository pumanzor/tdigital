terraform {
  backend "s3" {
    bucket         = "nombre-del-bucket"
    key            = "path/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}
