output "vpc_id" {
  value = module.vpc.vpc_id
}

output "eks_cluster_id" {
  value = module.eks.cluster_id
}

output "cluster_security_group_id" {
  value = module.eks.cluster_security_group_id
}