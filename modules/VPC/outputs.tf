output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.web_Application_VPC.id
  
}

output "subnet_ids" {
  description = "List of Subnet IDs"
  value       = [for s in aws_subnet.web_Application_Subnet : s.id]  # collect all subnet IDs
}