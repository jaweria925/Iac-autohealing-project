output "iam_instance_profile_name" {
  description = "The name of the IAM instance profile associated with the instances"
  value       = aws_iam_instance_profile.ec2_profile.name
  
}