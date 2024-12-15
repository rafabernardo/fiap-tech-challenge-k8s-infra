

data "aws_secretsmanager_secret" "db" {
  name = "database-secrets-2"
}

data "aws_secretsmanager_secret_version" "db" {
  secret_id = data.aws_secretsmanager_secret.db.id
}
