variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = ""

}
variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default = {
    Name = "VPC"
  }

}
variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
  default     = ""

}

variable "subnet_ids" {
  description = "The IDs of the Subnets"
  type        = list(string)
  default     = []

}

variable "alb_name" {
  description = "The name of the Application Load Balancer"
  type        = string
  default     = "my-alb"

}
variable "instance_type" {
  description = "The type of EC2 instance to launch"
  type        = string
  default     = "t2.micro"

}
variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "Terraform-demo"

}


variable "iam_instance_profile_name" {
  description = "The name of the IAM instance profile to associate with the instances"
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
  description = "AMI ID"
  type        = string
  default     = ""
}

