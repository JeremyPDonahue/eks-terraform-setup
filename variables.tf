variable "aws_region" {
  description = "The AWS region where resources will be deployed"
  type        = string
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}