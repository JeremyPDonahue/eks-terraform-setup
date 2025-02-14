resource "aws_vpc" "eks_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "eks-vpc"
  }
}

resource "aws_subnet" "private" {
  count = 2
  vpc_id = aws_vpc.eks_vpc.id
  cidr_block = cidrsubnet(var.vpc_cidr, 4, count.index)
  map_public_ip_on_launch = false

  tags = {
    Name = "eks-private-subnet-${count.index}"
  }
}

resource "aws_subnet" "public" {
  count = 2
  vpc_id = aws_vpc.eks_vpc.id
  cidr_block = cidrsubnet(var.vpc_cidr, 4, count.index + 2)
  map_public_ip_on_launch = true

  tags = {
    Name = "eks-public-subnet-${count.index}"
  }
}