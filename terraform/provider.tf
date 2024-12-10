terraform {

  required_version = ">= 0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.80.0"
    }
  }
  backend "s3" {
    bucket = "fiap-tech-challenge-terraform"
    key    = "fiap-tech-challenge-terraform-eks/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.regionDefault
}
