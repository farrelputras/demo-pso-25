variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-southeast-1"
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

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "development"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "book-library"
}

variable "database_url" {
  description = "Name of the DynamoDB table"
  type        = string
  default     = "books" # Default table name from lambda.js [cite: 31]
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "BookLibraryFunction"
}

variable "jwt_secret" {
  description = "JWT secret key for authentication"
  type        = string
  sensitive   = true
  
  validation {
    condition     = length(var.jwt_secret) >= 32
    error_message = "JWT secret must be at least 32 characters long."
  }
}
