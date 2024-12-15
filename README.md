## Descricao do Projeto

Esse repositório contém a infraestrtura do projeto de Software Architecture da FIAP. A infraestrutura é composta por um banco de dados PostgreSQL na AWS RDS, uma imagem no ECR e um cluster EKS.

## Pré-requisitos

- [Terraform](https://www.terraform.io/downloads.html) >= 1.10.0
- Conta AWS com permissões apropriadas
- Secrets configurados no repositório do GitHub para credenciais da AWS e outros dados sensíveis
- Um bucket S3 para armazenar o estado do Terraform
- Imagem deployada no ECR, gerada pelo projeto [fiap-tech-challenge](https://github.com/rafabernardo/fiap-tech-challenge-1)

## GitHub Actions

Essa infraestrutura utiliza o GitHub Actions para automatizar os fluxos de trabalho do Terraform. O pipeline é definido em [`.github/workflows/pipeline.yml`](.github/workflows/pipeline.yml).

### GitHub Secrets

- `AWS_ACCESS_KEY_ID`: AWS access key ID
- `AWS_SECRET_ACCESS_KEY`: AWS secret access key
- `AWS_REGION`: AWS region
- `AWS_SESSION_TOKEN`: AWS session token (obrigatorio para contas AWS Academy )
- `BUCKET_TF_STATE`: S3 bucket para armazenar o estado do Terraform
- `ACTION_GITHUB_TOKEN`: Token de acesso do GitHub
- `API_IMAGE`: Link do repositorio ECR gerada pelo projeto [fiap-tech-challenge](https://github.com/rafabernardo/fiap-tech-challenge-1)
