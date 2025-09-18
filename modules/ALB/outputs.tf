output "alb_arn" {
  description = "The ARN of the ALB"
  value       = aws_lb.Web_application_ALB.arn
  
}
 output "target_group_arn" {
  description = "The ARN of the target group"
  value       = aws_lb_target_group.web_app_tg.arn
   
 }
  output "alb_dns_name" {
    description = "The DNS name of the ALB"
    value       = aws_lb.Web_application_ALB.dns_name
  }

  output "alb_sg" {
     value       = aws_security_group.alb_sg.id
    description = "Security Group ID for the ALB"
  }