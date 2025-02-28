terraform {
  backend "s3" {
    bucket         = "js-test-cluster-state-bucket"
    key            = "eks-cluster/terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
    dynamodb_table = "js-lock-table"
    use_lockfile   = true
  }
}