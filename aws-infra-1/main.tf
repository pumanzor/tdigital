module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  name   = "eks-vpc"
  cidr   = "172.30.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  public_subnets  = ["172.30.2.0/24", "172.30.3.0/24"]
  private_subnets = ["172.30.4.0/24", "172.30.5.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "security" {
  source           = "./modules/security"
  vpc_id           = module.vpc.vpc_id
  allowed_ssh_cidr = "190.190.190.190/32"
}

module "ec2" {
  source                = "./modules/ec2"
subnet_id = module.vpc.public_subnets[0] 
  ssh_key_name          = "mi-clave-ssh"
  security_group_ssh_id = module.security.ssh_access_sg_id
}


module "eks" {
  source          = "./modules/eks"
  subnet_ids      = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id
}
