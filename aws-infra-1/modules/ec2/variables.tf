variable "ssh_key_name" {
  description = "Nombre de la llave SSH para conectarse a la instancia"
  type        = string
}

variable "security_group_ssh_id" {
  description = "ID del Security Group que permite acceso SSH"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
  type        = string
}

