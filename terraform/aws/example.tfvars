ami_id        = "ami-0c1907b6d738188e5" # Example AMI ID for Ubuntu 22.04 in ap-southeast-1 Already Set as Default in variables.tf
key_pair_name = "your-key-pair-name"
database_url  = "http://localhost:27017"

# VPC Configuration
vpc_cidr           = "10.0.0.0/16"
public_subnet_cidr = "10.0.1.0/24"
environment        = "development"
project_name       = "pso-demo"

# AWS Region
aws_region = "ap-southeast-1"
