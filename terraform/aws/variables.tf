variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-southeast-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "production"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "pso-demo"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0c1907b6d738188e5" # AMI ID for Ubuntu 20.04 in ap-southeast-1
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_pair_name" {
  description = "SSH key pair name for EC2 instances"
  type        = string
}

# --- VPC Variables ---
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR blocks for public subnets"
  type        = string
  default     = "10.0.1.0/24"
}

variable "database_url" {
  description = "URL of the MongoDB"
  type        = string
}
