resource "aws_eks_node_group" "eks-fiap-tech-node" {
  cluster_name    = aws_eks_cluster.eks-fiap-tech.name
  node_group_name = var.nodeGroupName
  node_role_arn   = data.aws_iam_role.name.arn
  subnet_ids      = [for subnet in data.aws_subnet.selected : subnet.id if subnet.availability_zone != "us-east-1e"]
  disk_size       = 20
  instance_types = [
    var.nodeInstanceType
  ]


  scaling_config {
    desired_size = 1
    min_size     = 1
    max_size     = 2
  }

  depends_on = [aws_eks_cluster.eks-fiap-tech]
}
