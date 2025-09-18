# Auto-Healing Web Tier (Terraform on AWS)

## Overview
Deploys an auto-healing web tier behind an Application Load Balancer. Requirements satisfied:
- Self-healing: ASG replaces unhealthy/terminated instances.
- Self-provisioning: `terraform init && terraform apply -var-file=envs/dev.tfvars -auto-approve`
- N+1 capacity: min=2, desired=2, max=3
- Static web page (NGINX) served on port 80

## Choice of cloud
**AWS** selected because Terraform has mature AWS support and ASG+ALB pair gives straightforward self-healing + Load balancing behavior.

## Repo layout
(briefly list files as in repo structure)

## Prerequisites
- Terraform v1.5+ installed
- AWS CLI 
- login aws using aws configure 
- Eneter credentials configured (or export AWS_ACCESS_KEY_ID / AWS_SECRET_ACCESS_KEY)


## Quick start (one-command)
1. `cd infra-autoheal`
2. `terraform init` # To initialize plugins
3. terraform plan # to view the infra output
3. `terraform apply -auto-approve`
4. Output prints `alb_dns_name` — open in browser.

## How to test auto-healing
1. Note the ALB DNS and instance IDs: `aws ec2 describe-instances ...`
2. Terminate one instance via console or `aws ec2 terminate-instances --instance-ids <id>`
3. ASG will launch a replacement automatically. Access ALB — no downtime expected.

## Optional: Containerised page
(Explain Dockerfile, how to push, and how to set user-data to pull image)

## Architecture diagram
`architecture.png` included in repo.

## Cost estimate & assumptions
- Region: ap-southeast-2 (Sydney)
- Instance: t2.micro(free tier)
- Hours: 730 hours/month
- Estimated monthly cost: ~AUD 12–18

## Pipeline
GitHub Actions workflow present at `.github/workflows/terraform-ci.yml` (runs fmt/validate/plan).

## Deliverables included
- Terraform modules
- README.md
- architecture.png
- Dockerfile (if used)
- `.github/workflows/terraform-ci.yml`
- commit history (see Git history)

## Contact
Owner: Your Name / your-email@example.com
