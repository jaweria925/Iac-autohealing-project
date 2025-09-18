output "ec2_sg" {
  description = "Ec2 instance security group"
  value = aws_security_group.ec2_sg.id
}