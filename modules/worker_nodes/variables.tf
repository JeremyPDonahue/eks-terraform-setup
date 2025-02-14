variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the worker nodes will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "List of public subnet IDs for worker nodes"
  type        = list(string)
}

variable "node_role_arn" {
  description = "IAM Role ARN for the worker nodes"
  type        = string
}