terraform {
  backend "s3" {
    bucket         = "js-test-cluster-state-bucket"
    key            = "eks-cluster/terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
    use_lockfile = "js-lock-table"
  }
}