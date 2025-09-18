variable "project_name" {
    description = "The name of the project."
    type        = string
  
}

variable "instance_type" {
    description = "The instance type to use for the launch template."
    type        = string
    default     = "t2.micro"
}

variable "tags" {
    description = "A map of tags to assign to the resources."
    type        = map(string)
    default     = {}    
  
}



variable "asg_name" {
    description = "The name of the Auto Scaling Group."
    type        = string
    default     = "my-asg"
  
}


variable "desired_capacity" {
    description = "The desired capacity of the Auto Scaling Group."
    type        = number
    default     = 2    
  
}

variable "max_size" {
    description = "The maximum size of the Auto Scaling Group."
    type        = number
    default     = 3      
  
}

variable "min_size" {
    description = "The minimum size of the Auto Scaling Group."
    type        = number
    default     = 2         
  
}
variable "vpc_id" {
    description = "The ID of the VPC."
    type        = string
    default     = ""    
  
}
variable "subnet_ids" {
    description = "The IDs of the Subnets."
    type        = list(string)
    default     = []    
  
}
variable "iam_instance_profile_name" {
    description = "The name of the IAM instance profile to associate with the instances."
    type        = string
    default     = ""    
  
}
variable "target_group_arn" {

  description = "target group arn"
    type        = string
    default     = ""    
  
}
variable "ami_id" {
  description = "AMI ID"
    type        = string
    default     = "" 
}

variable "alb_sg" {
    description = "security gorup"
    type        = string
    default     = "" 
}