provider "aws" {
  region = "ap-southeast-2"
  
}
module "VPC" {
  source     = "./modules/VPC"
  vpc_cidr = var.vpc_cidr
    tags = var.tags
}


module "ALB" {
  source     = "./modules/ALB"
  alb_name   = var.alb_name
  vpc_id     = module.VPC.vpc_id
  subnet_ids = module.VPC.subnet_ids
  tags       = var.tags
  
}

module "iam" {
  source       = "./modules/iam"
}

module "ASG" {
  source                    = "./modules/ASG"
  vpc_id                    = module.VPC.vpc_id
  subnet_ids                = module.VPC.subnet_ids
  instance_type             = var.instance_type
  project_name              = var.project_name
  alb_sg     = module.ALB.alb_sg
  
  iam_instance_profile_name = module.iam.iam_instance_profile_name
  target_group_arn      = module.ALB.target_group_arn
  tags                      = var.tags  
  ami_id = var.ami_id

}

