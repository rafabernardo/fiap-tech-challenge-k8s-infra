resource "aws_lb_target_group" "tg" {
  name        = "TG-${var.projectName}"
  port        = 30007
  target_type = "instance"
  protocol    = "HTTP"

  vpc_id = var.vpcId

  health_check {
    path    = "/"
    port    = 30007
    matcher = "200"
  }
}
