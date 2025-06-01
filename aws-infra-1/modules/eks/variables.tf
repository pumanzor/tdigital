variable "vpc_id" {
  description = "ID de la VPC donde se desplegará el EKS"
  type        = string
}

variable "subnet_ids" {
  description = "Subredes privadas para el EKS"
  type        = list(string)
}
