# AWS Infrastructure Deployment with Terraform

This repository contains a modular and production-grade Terraform configuration to deploy a foundational AWS infrastructure that includes:

-  A fully configured VPC with public/private subnets
-  An EC2 instance (`t3.micro`) accessible via SSH
-  A secure S3 bucket
-  A managed EKS (Elastic Kubernetes Service) cluster
-  Route 53 record pointing to EKS Load Balancer
-  Modular code with reusable components and controlled security

---

## ✅ Technical Requirements Coverage

| Requirement                                                              | Status |
|---------------------------------------------------------------------------|--------|
| VPC with public and private subnets                                      | ✅     |
| EC2 instance with SSH access (restricted to IP)                          | ✅     |
| S3 bucket with access control policies                                   | ✅     |
| EKS cluster with managed node group                                      | ✅     |
| Route 53 record alias to EKS Load Balancer                               | ⚠️     |
| SSH access restricted via Security Group                                 | ✅     |
| Full infrastructure defined via Terraform modules                        | ✅     |

> ⚠️ Route 53 zone must already exist and be passed via `route53_zone_id`.

---

##  Directory Structure

```
aws-infra-1/
├── main.tf                     # Orchestration of all modules
├── provider.tf                # AWS provider setup
├── modules/
│   ├── vpc/                   # VPC, subnets, NAT
│   ├── ec2/                   # Bastion EC2 instance
│   ├── security/              # Security Groups, S3 hardening
│   ├── s3/                    # Additional bucket definitions
│   ├── eks/                   # Kubernetes cluster
│   └── route53/               # DNS record for EKS ingress
```

---

## ⚙️ Requirements

- Terraform ≥ 1.3
- AWS CLI configured with appropriate credentials
- SSH key pair available in AWS EC2 Console

---

##  Deployment Steps

### 1. Clone the repository
```bash
git clone https://github.com/pumanzor/tdigital.git
cd tdigital/aws-infra-1
```

### 2. Create `terraform.tfvars`
```hcl
ssh_key_name        = "your-ec2-keypair-name"
allowed_ssh_cidr    = "190.190.190.190/32"
route53_zone_id     = "ZXXXXXXXXXXXX"
domain              = "yourdomain.com"
```

### 3. Initialize Terraform
```bash
terraform init
```

### 4. Validate and preview the plan
```bash
terraform plan
```

### 5. Apply the configuration
```bash
terraform apply
```

---

## Suggested Outputs

To enhance usability, consider adding the following to `outputs.tf`:

```hcl
output "ec2_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "s3_bucket_name" {
  value = aws_s3_bucket.secure_bucket.bucket
}
```

---

## Security Considerations

- SSH access is restricted to a single public IP (`190.190.190.190/32`)
- S3 bucket is private with all public access blocked
- Security groups are explicitly scoped and managed
- IAM roles for EKS use IRSA where applicable

---

##  Author

Pablo Umanzor A. – Solution Architect / Infrastructure Engineer 
GitHub: [pumanzor](https://github.com/pumanzor)

---
