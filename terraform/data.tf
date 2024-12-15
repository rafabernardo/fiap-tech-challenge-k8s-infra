data "aws_iam_role" "name" {
  name = "LabRole"
}

data "aws_vpc" "vpc" {
  cidr_block = var.vpcCidr
}

data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
}

data "aws_subnet" "subnet" {
  for_each = toset(data.aws_subnets.subnets.ids)
  id       = each.value
}


data "terraform_remote_state" "rds" {
  backend = "s3"
  config = {
    bucket = "fiap-tech-challenge-terraform"
    key    = "fiap-tech-challenge-terraform-db/terraform.tfstate"
    region = "us-east-1"
  }
}

data "aws_secretsmanager_secret" "db" {
  name = "database-secrets-1"
}

data "aws_secretsmanager_secret_version" "db" {
  secret_id = data.aws_secretsmanager_secret.db.id
}
