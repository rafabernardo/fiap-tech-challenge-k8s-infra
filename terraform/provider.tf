terraform {
  backend "s3" {
    bucket = "fiap-tech-challenge-terraform-145360588665"
    key    = "fiap-tech-challenge-terraform-145360588665/terraform.tfstate"
    region = "us-east-1"
  }
}
provider "aws" {
  region = var.regionDefault
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}
