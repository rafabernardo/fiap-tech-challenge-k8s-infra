data "aws_iam_role" "name" {
  name = "LabRole"
}

data "aws_vpcs" "selected" {
  filter {
    name   = "isDefault"
    values = ["true"]
  }
}

data "aws_subnets" "selected" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpcs.selected.ids[0]]
  }
}

data "aws_subnet" "selected" {
  for_each = toset(data.aws_subnets.selected.ids)

  id = each.value
}

data "aws_security_group" "eks-sg" {
  id = aws_eks_cluster.eks-fiap-tech.vpc_config[0].cluster_security_group_id
}

data "terraform_remote_state" "rds" {
  backend = "s3"
  config = {
    bucket = "fiap-tech-challenge-terraform"
    key    = "fiap-tech-challenge-terraform-db/terraform.tfstate"
    region = "us-east-1"
  }
}
