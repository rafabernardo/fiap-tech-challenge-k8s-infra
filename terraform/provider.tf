terraform {
  backend "s3" {
    bucket = "${var.s3BucketName}"
    key    = "${var.s3BucketName}-eks/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.regionDefault
}
