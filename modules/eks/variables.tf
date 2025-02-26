variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "aws_region" {
  description = "The AWS region where resources will be deployed"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the EKS cluster will be deployed"
  type        = string
}

variable "subnet_ids" {
  type    = list(string)
  default = ["subnet-018a047e6e74acc93", "subnet-0cf8dd5bd2868fff8"]
}


variable "eks_role_arn" {
  description = "IAM Role ARN for the EKS cluster"
  type        = string
}