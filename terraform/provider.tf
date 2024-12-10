terraform {
  backend "s3" {
    bucket = "tfiap-tech-challenge-terraform"
    key    = "fiap-tech-challenge-terraform-eks/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.regionDefault
}
