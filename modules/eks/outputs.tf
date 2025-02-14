output "cluster_id" {
  value = aws_eks_cluster.js-test-cluster.id
}

output "cluster_endpoint" {
  value = aws_eks_cluster.js-test-cluster.endpoint
}

output "cluster_certificate_authority_data" {
  value = aws_eks_cluster.js-test-cluster.certificate_authority[0].data
}