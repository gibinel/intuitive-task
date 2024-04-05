variable "environment" {
  description = "EC2 enviroment"
  type = string
}

variable "aws_region" {
  description = "AWS region to launch the EC2 instance"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type of the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
}

variable "security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
}

variable "created_by" {
  description = "Created by Terraform tag"
  default = "terraform"
}

locals {
  required_tags = {
    "Environment" = var.environment,
    "Created by"  = var.created_by
  }
}
