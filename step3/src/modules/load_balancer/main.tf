resource "aws_lb_target_group" "main" {
  name        = "${var.name}-main"
  port        = 3000
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id   = var.vpc_id

  health_check {
    interval            = 30
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
   }

  tags = {
    Name      = "${var.name}-main"
    Owner     = "${var.name}-owner"
    CreatedBy = var.name
    Purpose   = "step3"
  }
}

resource "aws_lb_target_group_attachment" "main"{
  count            = 1
  target_group_arn = aws_lb_target_group.main.arn
  target_id        = var.instances[0]
}

resource "aws_lb" "main" {
  name               = "${var.name}-main"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets = var.subnet_ids
}
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}
