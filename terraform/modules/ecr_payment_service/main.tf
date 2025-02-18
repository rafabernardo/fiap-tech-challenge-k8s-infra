resource "aws_ecr_repository" "ecr_payment_service" {
  name                 = "ecr_payment_service"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}
