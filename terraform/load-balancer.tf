resource "aws_alb" "alb" {
  name               = "ALB-${var.projectName}"
  internal           = false
  load_balancer_type = "application"
  subnets            = [for subnet in data.aws_subnet.selected : subnet.id if subnet.availability_zone != "us-east-1e"]
  security_groups    = [aws_security_group.sg.id]
  idle_timeout       = 60
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_alb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}
