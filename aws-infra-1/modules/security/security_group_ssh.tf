variable "vpc_id" {
  description = "ID de la VPC donde se aplicará el Security Group"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "Bloque CIDR permitido para el acceso SSH"
  type        = string
}


resource "aws_security_group" "ssh_access" {
  name        = "ec2-ssh-access"
  description = "Permite acceso SSH desde IP pública definida"
  vpc_id      = var.vpc_id

  ingress {
    description = "Permitir SSH desde IP especificada"
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
