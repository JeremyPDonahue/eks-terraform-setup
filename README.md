# EKS Terraform Setup

## Overview
This Terraform project provisions an **Amazon EKS cluster** with a **VPC, IAM roles, and worker nodes** in AWS.

## Structure
```
.
├── modules/
│   ├── vpc/           # VPC and subnets
│   ├── iam/           # IAM roles and policies
│   ├── eks/           # EKS cluster
│   ├── worker_nodes/  # Worker nodes
│
├── provider.tf        # Provider configuration
├── main.tf            # Root module
├── variables.tf       # Input variables
├── outputs.tf         # Outputs
├── .gitignore         # Ignore Terraform state files
```

## Prerequisites
- **Terraform v1.3.0+**
- **AWS CLI configured**
- **kubectl installed**

## Usage
```sh
terraform init
terraform plan -auto-approve
terraform apply -auto-approve
aws eks update-kubeconfig --region <region> --name <cluster_name>
```

## Outputs
- **EKS Cluster ID**
- **EKS API Endpoint**
- **Worker Node Group Name**