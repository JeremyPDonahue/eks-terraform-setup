data "aws_eks_cluster" "this" {
  name = var.cluster_name
}

resource "aws_eks_node_group" "worker_nodes" {
  cluster_name   = var.cluster_name
  node_role_arn  = var.worker_nodes_role_arn
  subnet_ids     = var.subnet_ids
  ami_type       = "AL2_x86_64"

  depends_on = [eks.aws_eks_cluster.js-test-cluster]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  launch_template {
    id      = aws_launch_template.worker_nodes.id
    version = "$Latest"
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

resource "aws_launch_template" "worker_nodes" {
  name_prefix   = "${var.cluster_name}-worker"
  instance_type = "t3.medium"

  user_data = base64encode(<<-EOT
    MIME-Version: 1.0
    Content-Type: multipart/mixed; boundary="BOUNDARY"

    --BOUNDARY
    Content-Type: text/x-shellscript; charset="us-ascii"

    #!/bin/bash
    /etc/eks/bootstrap.sh ${var.cluster_name} \
      --apiserver-endpoint ${data.aws_eks_cluster.this.endpoint} \
      --b64-cluster-ca ${data.aws_eks_cluster.this.certificate_authority.0.data}

    --BOUNDARY--
  EOT
  )


  network_interfaces {
    associate_public_ip_address = true
    security_groups = [aws_security_group.worker_nodes_sg.id]
  # <-- Force your custom SG
  }
}

