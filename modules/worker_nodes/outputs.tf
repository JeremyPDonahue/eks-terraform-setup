output "worker_node_group_name" {
  value = aws_eks_node_group.worker_nodes.node_group_name
}

output "worker_nodes_security_group_id" {
  value = aws_security_group.worker_nodes_sg.id
}
