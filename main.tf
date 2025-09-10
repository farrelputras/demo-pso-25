terraform {
  required_version = ">= 1.5.0"
}

provider "aws" {
  region = "us-east-1"
}

variable "cloud_provider" {
  description = "Which cloud to deploy to: aws or azure"
  type        = string
}

module "aws" {
  source = "./aws"
  count  = var.cloud_provider == "aws" ? 1 : 0
}

# module "azure" {
#   source = "./azure"
#   count  = var.cloud_provider == "azure" ? 1 : 0
# }
