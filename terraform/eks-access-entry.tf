resource "aws_eks_access_entry" "access-entry" {
  cluster_name      = aws_eks_cluster.eks-fiap-tech.name
  principal_arn     = var.principalArn
  kubernetes_groups = ["fiap"]
  type              = "STANDARD"
}
