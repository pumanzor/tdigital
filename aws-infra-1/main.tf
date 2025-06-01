module "vpc" {
  source = "./modules/vpc"
}

module "security" {
  source            = "./modules/security"
  vpc_id            = module.vpc.vpc_id
  allowed_ssh_cidr  = "190.190.190.190/32"
}

module "ec2" {
  source                 = "./modules/ec2"
  ssh_key_name           = "mi-clave-ssh"  
  security_group_ssh_id  = module.security.ssh_access_sg_id
}
