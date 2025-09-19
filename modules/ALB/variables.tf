variable "alb_name" {
    description = "The name of the Application Load Balancer"
    type        = string
    default     = "my-alb"
  
}


variable "tags" {
    description = "A map of tags to assign to the ALB"
    type        = map(string)
    default     = {}
  
}
variable "vpc_id" {
    description = "The ID of the VPC where the ALB will be deployed"
    type        = string
  
}

variable "subnet_ids" {
    description = "A list of Subnet IDs where the ALB will be deployed"
    type        = list(string)  
    
  
}

