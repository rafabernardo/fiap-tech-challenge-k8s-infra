module "eks" {
  source             = "./modules/eks"
  eks_name           = var.eksName
  node_group_name    = var.nodeGroupName
  node_instance_type = var.nodeInstanceType
  subnet_ids         = [for subnet in data.aws_subnet.subnet : subnet.id if subnet.availability_zone != "${var.regionDefault}e"]
  security_group_id  = module.security_group.security_group_id
  access_config      = var.accessConfig
  region             = var.regionDefault
  account_id         = var.accountId
  policy_arn         = var.policyArn
  role_arn           = data.aws_iam_role.name.arn

  depends_on = [module.security_group, module.db]
}

module "security_group" {
  source              = "./modules/security_group"
  security_group_name = var.securityGroupeName
  vpc_id              = data.aws_vpc.vpc.id
}

module "api" {
  source      = "./modules/api"
  api_image   = var.apiImage
  db_url      = module.db.url
  db_db_name  = module.db.db-name
  secret-name = module.db.secret-name

  depends_on = [module.eks, module.security_group, module.db]
}

module "db" {
  source            = "git::https://github.com/rafabernardo/fiap-tech-challenge-db-infra.git//terraform?ref=main"
  security_group_id = module.security_group.security_group_id
}

output "db-name" {
  value = module.db.db-name
}

output "url" {
  value = module.db.url
}

output "db-secret-name" {
  value = module.db.secret-name
}
