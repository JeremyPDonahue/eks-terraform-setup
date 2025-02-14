variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the EKS cluster will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "List of public subnet IDs where the EKS nodes will be deployed"
  type        = list(string)
}

variable "eks_role_arn" {
  description = "IAM Role ARN for the EKS cluster"
  type        = string
}