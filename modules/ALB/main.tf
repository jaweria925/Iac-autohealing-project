
resource "aws_security_group" "alb_sg" {
  vpc_id = var.vpc_id
  name = "ALb-aws_security_group"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(
        {
        "Name"    = "${var.alb_name}-alb-sg"
        },
        var.tags,
    )
}



resource "aws_lb" "Web_application_ALB" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  subnets            = var.subnet_ids
  security_groups    = [aws_security_group.alb_sg.id] 
  tags               = var.tags
  
}

# create a target group for the ALB
resource "aws_lb_target_group" "web_app_tg" {
  name     = "web-app-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }

  tags = var.tags
}


#create a listener for the ALB
resource "aws_lb_listener" "web_app_listener" {
  load_balancer_arn = aws_lb.Web_application_ALB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_app_tg.arn
  }
}