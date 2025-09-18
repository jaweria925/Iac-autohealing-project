
# security group for ec2 instances

resource "aws_security_group" "ec2_sg" {
    name        = "${var.project_name}-ec2-sg"
    description = "Security group for EC2 instances"
    vpc_id      = var.vpc_id
    
    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups  = [var.alb_sg]
  }

  


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

    tags = merge(
        {
        "Name"    = "${var.project_name}-ec2-sg"
        },
        var.tags,
    )
}

resource "aws_launch_template" "web_application_ASG" {

    name_prefix   = "${var.project_name}-web-app-lt"
    image_id      = var.ami_id
    instance_type = var.instance_type

    network_interfaces {
            associate_public_ip_address = true
            security_groups = [aws_security_group.ec2_sg.id]
    }   
   
    iam_instance_profile {
        name = var.iam_instance_profile_name
    }
    
    //vpc_security_group_ids = [aws_security_group.ec2_sg.id]
    
     user_data = base64encode(<<-EOT
                #!/bin/bash
                apt-get update -y
                apt-get install -y nginx
                systemctl start nginx
                systemctl enable nginx
                echo "<h1>Hello from ${var.project_name} - $(hostname)</h1>" > /var/www/html/index.html
    EOT
)
    
    tag_specifications {
        resource_type = "instance"
    
        tags = merge(
        {
            "Name"        = "${var.project_name}-web-app-instance"
        
        },
        var.tags,
        )
    }
}

resource "aws_autoscaling_group" "web_asg" {
    name = "${var.asg_name}-web-app-asg"
    desired_capacity     = var.desired_capacity
    max_size             = var.max_size
    min_size             = var.min_size
    vpc_zone_identifier  = var.subnet_ids
    target_group_arns   = [var.target_group_arn]
    health_check_type   = "ELB"
    health_check_grace_period = 60
    launch_template {
        id      = aws_launch_template.web_application_ASG.id
        version = "$Latest"
    }
    
    tag {
        key                 = "Name"
        value               = "${var.project_name}-web-app-asg"
        propagate_at_launch = true
    }
    
}