
module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "iam" {
  source       = "./modules/iam"
  cluster_name = var.cluster_name
}

module "eks" {
  source          = "./modules/eks"
  cluster_name    = var.cluster_name
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.public_subnet_ids
  eks_role_arn    = module.iam.eks_role_arn
}

module "worker_nodes" {
  source       = "./modules/worker_nodes"
  cluster_name = var.cluster_name
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.public_subnet_ids
  worker_nodes_role_arn = module.iam.worker_nodes_role_arn
}