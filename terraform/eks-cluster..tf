resource "aws_eks_cluster" "eks-fiap-tech" {
  name     = var.eksName
  role_arn = data.aws_iam_role.name.arn

  vpc_config {
    endpoint_public_access = "true"
    public_access_cidrs    = ["0.0.0.0/0"]
    subnet_ids             = [for subnet in data.aws_subnet.subnet : subnet.id if subnet.availability_zone != "${var.regionDefault}e"]
    security_group_ids     = [aws_security_group.sg.id]
  }

  access_config {
    authentication_mode = var.accessConfig
  }
}

