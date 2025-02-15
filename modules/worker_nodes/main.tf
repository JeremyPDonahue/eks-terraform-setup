resource "aws_eks_node_group" "worker_nodes" {
  cluster_name    = var.cluster_name
  node_role_arn   = var.worker_nodes_role_arn
  subnet_ids      = var.subnet_ids
  instance_types  = ["t3.medium"]
  ami_type        = "AL2_x86_64"
  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }
  tags = {
    Name = "eks-worker-nodes"
  }
}

resource "aws_security_group" "worker_nodes_sg" {
  name        = "eks-worker-nodes-sg"
  description = "Security group for EKS worker nodes"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
