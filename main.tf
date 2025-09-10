terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "> 5.0"
    }
    # Add Azure provider here if needed
  }
}

variable "cloud_provider" {
  description = "Which cloud to deploy to: aws or azure"
  type        = string
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-southeast-1"
}

# Only configure AWS provider if deploying to AWS
provider "aws" {
  region = var.aws_region
  alias  = "default"

  # Prevents provider initialization unless count > 0
  skip_requesting_account_id = var.cloud_provider != "aws"
}

module "aws" {
  source = "./aws"
  count  = var.cloud_provider == "aws" ? 1 : 0

  aws_region      = var.aws_region
  environment     = var.environment
  project_name    = var.project_name
  ami_id          = var.ami_id
  instance_type   = var.instance_type
  key_pair_name   = var.key_pair_name
  vpc_cidr        = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  database_url    = var.database_url
  jwt_secret      = var.jwt_secret
}

# Example Azure module
# module "azure" {
#   source = "./azure"
#   count  = var.cloud_provider == "azure" ? 1 : 0
# }
