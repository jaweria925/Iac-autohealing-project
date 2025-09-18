variable "vpc_cidr" {
    description = "The CIDR block for the VPC"
    type        = string 
    default = ""      
  
}

variable "tags" {
    description = "A map of tags to assign to the resource"
    type        = map(string)
    default     = {
      Name = "VPC"
    }
  
}


variable "project_name" {
    description = "The name of the project"
    type        = string
    default     = "web-application"    
  
}