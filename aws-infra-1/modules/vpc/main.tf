module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.0"
  name = "eks-vpc"
  cidr = "172.30.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  public_subnets  = ["172.30.2.0/24", "172.30.3.0/24"]
  private_subnets = ["172.30.4.0/24", "172.30.5.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }

output "vpc_id" {
  value = module.vpc.vpc_id
}


}
