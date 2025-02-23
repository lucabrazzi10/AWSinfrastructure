# General Variables

variable "region" {
  description = "Default region for provider"
  type        = string
  default     = "us-east-1"
}

variable "app_name" {
  description = "Name of the web application"
  type        = string
  default     = "web-app"
}

variable "environment_name" {
  description = "Deployment environment (dev/staging/production)"
  type        = string
  default     = "dev"
}

# EC2 Variables

variable "ami" {
  description = "Amazon machine image to use for ec2 instance"
  type        = string
  default     = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
}

variable "instance_type" {
  description = "ec2 instance type"
  type        = list(string)
  default     = ["t2.micro", "t3.medium"]
}

variable "subnet_ids" {
  type    = list(string)
  default = ["aws_subnet.subnet_a.id", "aws_subnet.subnet_b.id", "aws_subnet.subnet_c.id",]  # Replace with actual subnet IDs
}

# S3 Variables

variable "bucket_prefix" {
  description = "prefix of s3 bucket for app data"
  type        = string
  default = "s3yomi"
}

# Route 53 Variables

variable "create_dns_zone" {
  description = "If true, create new route53 zone, if false read existing route53 zone"
  type        = bool
  default     = false
}

variable "domain" {
  description = "Domain for website"
  type        = string
  default = "s3yomi.com"
}

# RDS Variables

variable "db_name" {
  description = "Name of DB"
  type        = string
  default = "s3yomi"
}

variable "db_user" {
  description = "Username for DB"
  type        = string
  default = "admin"
}

variable "db_pass" {
  description = "Password for DB"
  type        = string
  default = "SecurePassword123!" 
  sensitive   = true
}


variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_a_cidr" {
  description = "The CIDR block for subnet A"
  default     = "10.0.1.0/24"
}

variable "subnet_b_cidr" {
  default     = "10.0.2.0/24"
  description = "The CIDR block for subnet B"
}
variable "subnet_c_cidr" {
  description = "The CIDR block for subnet C"
  default     = "10.0.3.0/24"
}