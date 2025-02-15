output "cluster_id" {
  value = aws_eks_cluster.js-test-cluster.id
}

output "cluster_name" {
  value = aws_eks_cluster.js-test-cluster.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.js-test-cluster.endpoint
}

output "cluster_certificate_authority_data" {
  value = aws_eks_cluster.js-test-cluster.certificate_authority[0].data
}

output "cluster_security_group_id" {
  value = aws_eks_cluster.js-test-cluster.vpc_config[0].cluster_security_group_id
}
