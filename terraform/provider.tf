terraform {
  backend "s3" {
    bucket = "fiap-tech-challenge-terraform"
    key    = "fiap-tech-challenge-terraform-eks/terraform.tfstate"
    region = "us-east-1"
  }
}
provider "aws" {
  region = var.regionDefault
}


provider "kubernetes" {
  host                   = aws_eks_cluster.eks-fiap-tech.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.eks-fiap-tech.certificate_authority[0].data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    # Specify cluster name dynamically
    args = ["eks", "get-token", "--cluster-name", aws_eks_cluster.eks-fiap-tech.name]
  }
}
