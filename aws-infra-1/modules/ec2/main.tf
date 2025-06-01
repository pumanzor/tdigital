resource "aws_instance" "bastion" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2
  instance_type = "t3.micro"
  subnet_id     = module.vpc.public_subnets[0]

  key_name      = var.ssh_key_name

  tags = {
    Name = "bastion-ec2"
  }
}
