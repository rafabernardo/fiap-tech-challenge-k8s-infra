resource "aws_eks_cluster" "eks-fiap-tech" {
  name     = var.eksName
  role_arn = data.aws_iam_role.name.arn

  vpc_config {
    endpoint_public_access = "true"
    public_access_cidrs    = ["0.0.0.0/0"]
    subnet_ids             = [for subnet in data.aws_subnet.selected : subnet.id if subnet.availability_zone != "us-east-1e"]
  }

  access_config {
    authentication_mode = var.accessConfig
  }
}
