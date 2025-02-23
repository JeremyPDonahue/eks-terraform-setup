
module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "iam" {
  source       = "./modules/iam"
  cluster_name = var.cluster_name
}

module "eks" {
  source       = "./modules/eks"
  cluster_name = var.cluster_name
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = [
    "subnet-05a2a065ed0df87ad", # us-west-2d
    "subnet-0cfd1c548c66d072e"  # us-west-2b
  ]
  eks_role_arn = module.iam.eks_role_arn
}

module "worker_nodes" {
  source                = "./modules/worker_nodes"
  cluster_name          = module.eks.cluster_name
  vpc_id                = module.vpc.vpc_id
  subnet_ids            = module.vpc.public_subnet_ids
  worker_nodes_role_arn = module.iam.worker_nodes_role_arn
}

resource "aws_security_group_rule" "eks_worker_nodes_to_control_plane" {
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = module.eks.cluster_security_group_id
  source_security_group_id = module.worker_nodes.worker_nodes_security_group_id
}

resource "aws_security_group_rule" "eks_node_to_node" {
  type                     = "ingress"
  from_port                = 10250
  to_port                  = 10255
  protocol                 = "tcp"
  security_group_id        = module.worker_nodes.worker_nodes_security_group_id
  source_security_group_id = module.worker_nodes.worker_nodes_security_group_id
}
