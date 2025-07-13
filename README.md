# EKS Terraform Setup

## Overview
This Terraform project provisions a **production-ready Amazon EKS cluster** with a **complete VPC, IAM roles, and worker nodes** in AWS.

## ✨ Recent Improvements
- ✅ **Complete VPC networking** with Internet Gateway, Route Tables, and proper routing
- ✅ **Enhanced security** with properly configured security groups (no more 0.0.0.0/0 ingress)
- ✅ **Local development support** with terraform.tfvars file
- ✅ **Improved outputs** for better module integration
- ✅ **Validated and formatted** code following Terraform best practices

## 🏗️ Infrastructure Components

### VPC Module
- **VPC** with DNS support and hostnames enabled
- **Internet Gateway** for public internet access
- **3 Public Subnets** across different AZs
- **Route Tables** with proper internet routing
- **Subnet associations** for load balancer integration

### EKS Module
- **EKS Cluster** with proper IAM roles
- **Security groups** for cluster communication
- **Public endpoint** access (configurable)

### Worker Nodes Module
- **Managed Node Groups** with auto-scaling
- **Launch Templates** for consistent node configuration
- **Secure Security Groups** restricting access to VPC and essential ports
- **T3.medium instances** (configurable)

### IAM Module
- **EKS Cluster Role** with necessary policies
- **Worker Node Role** with EKS, CNI, and ECR permissions
- **Policy attachments** following AWS best practices

## 📁 Project Structure
```
.github
│   └── workflows
│       └── terraform-deploy.yml    # CI/CD pipeline
├── README.md
├── backend.tf                      # S3 + DynamoDB backend
├── main.tf                         # Main module orchestration
├── terraform.tfvars                # Local configuration (gitignored)
├── terraform.tfvars.example        # Example configuration
├── modules
│   ├── eks/                        # EKS cluster module
│   ├── iam/                        # IAM roles and policies
│   ├── vpc/                        # VPC, subnets, networking
│   └── worker_nodes/               # EKS node groups
├── outputs.tf                      # Root module outputs
├── provider.tf                     # Provider configuration
└── variables.tf                    # Input variables
```

## 🚀 Prerequisites
- **AWS Account** with appropriate permissions
- **Terraform v1.3.0+** installed
- **AWS CLI** configured with credentials
- **kubectl** installed for cluster management

## 🔧 Local Development Setup

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd eks-terraform-setup
   ```

2. **Copy and configure variables**
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   # Edit terraform.tfvars with your specific values
   ```

3. **Initialize and plan**
   ```bash
   terraform init
   terraform plan
   ```

4. **Deploy (when ready)**
   ```bash
   terraform apply
   ```

## 🔐 Security Features

- **VPC-restricted ingress** for worker nodes
- **Minimal required permissions** for IAM roles
- **Encrypted S3 backend** for state storage
- **DynamoDB state locking** to prevent concurrent modifications
- **Security groups** following least privilege principle

## 🚀 CI/CD Pipeline

The repository includes a comprehensive GitHub Actions workflow:

- **Terraform Plan** on every push/PR
- **Manual deployment** via workflow_dispatch
- **Terraform destroy** capability
- **State cleanup** and reset functionality

### Required GitHub Secrets
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_REGION`
- `CLUSTER_NAME`
- `VPC_CIDR`
- `S3_BUCKET` (for reset functionality)

## 📊 Deployment Status

**Current Status**: ✅ **Ready for deployment**
- All modules validated and formatted
- Security improvements implemented
- Complete networking infrastructure
- 24 resources ready to be created

## 🛠️ Configuration

### Default Configuration
```hcl
aws_region   = "us-west-2"
cluster_name = "js-test-cluster"
vpc_cidr     = "10.0.0.0/16"
```

### Scaling Configuration
- **Min nodes**: 1
- **Max nodes**: 3
- **Desired nodes**: 2
- **Instance type**: t3.medium

## 🔍 Outputs

After deployment, the following outputs are available:
- `vpc_id` - VPC identifier
- `eks_cluster_id` - EKS cluster identifier
- `cluster_security_group_id` - Cluster security group ID

## 🧹 Cleanup

To destroy the infrastructure:
```bash
terraform destroy
```

Or use the GitHub Actions workflow with the "destroy" option.
