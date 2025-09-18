output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.VPC.vpc_id

}

output "subnet_ids" {
  description = "The IDs of the Subnets"
  value       = module.VPC.subnet_ids
}

output "alb_arn" {
  description = "The ARN of the Application Load Balancer"
  value       = module.ALB.alb_arn
}

output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = module.ALB.alb_dns_name
}

output "target_group_arn" {
  description = "The ARN of the target group"
  value       = module.ALB.target_group_arn

}

output "iam_instance_profile_name" {
  description = "The name of the IAM instance profile associated with the instances"
  value       = module.iam.iam_instance_profile_name

}

output "alb_sg" {
  value = module.ALB.alb_sg
}

output "ec2_sg" {
  value = module.ASG.ec2_sg
}

