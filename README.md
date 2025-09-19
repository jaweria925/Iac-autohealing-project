# Auto-Healing Web Tier (Terraform on AWS)

## Overview
Deploys an auto-healing web tier behind an Application Load Balancer. Requirements satisfied:
- Self-healing: ASG replaces unhealthy/terminated instances.
- Self-provisioning: terraform init && terraform apply -var-file=terraform.tfvars --auto-approve
- N+1 capacity: min=2, desired=2, max=3
- Static web page (NGINX) served on port 80

## Choice of cloud
**AWS** selected because Terraform has mature AWS support and ASG+ALB pair gives straightforward self-healing + Load balancing behavior.


## Prerequisites
- Terraform v1.5+ installed
- AWS CLI 
- Docker if containeize the applivation
- login aws using aws configure 
- Eneter credentials configured (or export AWS_ACCESS_KEY_ID / AWS_SECRET_ACCESS_KEY)


## Quick start (one-command)
1. cd Global-360 
2. terraform init # To initialize plugins
3. terraform plan # to view the infra output
3. terraform apply --auto-approve`
4. Output prints `alb_dns_name` — open in browser.

## How to test auto-healing
1. Note the ALB DNS and instance IDs: `aws ec2 describe-instances ...`
2. Terminate one instance via console or `aws ec2 terminate-instances --instance-ids <id>`
3. ASG will launch a replacement automatically. Access ALB — no downtime expected.

## Optional: Containerised page
I used Static Page for Demo But iwrite all the step which needed for containerize the application
# Build docker image 
docker build -t  repo-name:nginx-v1
# push docker image to REpo
docker push repo-name:nginx-v1
# Pull Docker image from Docker Hub
docker pull repo-name:nginx-v1
# Run container automatically
docker run -d -p 80:80 --name nginx-server repo-name:nginx-v1

## Architecture diagram
Architecture Diagram included in repo.

## Cost estimate & assumptions
- Region: ap-southeast-2 (Sydney)
- Instance: t3.micro
- Hours: 730 hours/month
- Estimated monthly cost: ~AUD 12–18

## Pipeline
GitHub Actions workflow present at `.github/workflows/terraform_ci.yml` (runs fmt/validate/plan).
Set up AWS credentials in Github Repository 

## Deliverables included
- Terraform modules
- README.md
- architecture.png
- Dockerfile (if used)
- .github/workflows/terraform-ci.yml


