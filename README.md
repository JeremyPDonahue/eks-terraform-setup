# EKS Terraform Setup

## Overview
This Terraform project provisions an **Amazon EKS cluster** with a **VPC, IAM roles, and worker nodes** in AWS.

## Structure
```
.github
│   └── workflows
│       └── terraform-deploy.yml
├── README.md
├── backend.tf
├── main.tf
├── modules
│   ├── eks
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── iam
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── vpc
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── worker_nodes
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── outputs.tf
├── provider.tf
└── variables.tf
```

## Prerequisites
- **AWS Account**
- **Terraform v1.3.0+**
- **AWS CLI configured**
- **kubectl installed**

## Usage
To run manually from your CLI, you can use Terraform locally. However, I have included a workflows file which implements a pipeline so it can be deploy directly from GitHub.

```sh
terraform init
terraform plan
terraform apply
```