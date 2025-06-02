resource "aws_instance" "bastion" {
  ami           = "ami-0c02fb55956c7d316" 
  instance_type = "t3.micro"
#  subnet_id     = module.vpc.public_subnets[0]
subnet_id     = var.subnet_id
  key_name      = var.ssh_key_name

  vpc_security_group_ids = [
    var.security_group_ssh_id
  ]

  tags = {
    Name = "bastion-ec2"
  }
}
