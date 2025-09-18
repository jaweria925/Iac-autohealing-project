variable "role_name" {
    description = "The base name for the IAM role."
    type        = string
    default     = "webapp"
  
}
variable "profile_name" {
    description = "The base name for the IAM instance profile."
    type        = string
    default     = "webapp"
  
}
variable "iam_instance_profile_name" {
    description = "The name of the IAM instance profile to associate with the instances."
    type        = string
    default     = ""
  
}