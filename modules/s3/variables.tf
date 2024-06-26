variable "environment" {
  description = "S3 bucket enviroment"
  type = string
}

variable "aws_region" {
  description = "AWS region for the S3 bucket"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "versioning" {
  description = "State of versioning for the S3 bucket"
  type        = string
  default     = "Enabled"
}

variable "server_side_encryption" {
  description = "Server-side encryption configuration"
  type        = map(any)
  default = {
    # sse_algorithm = "AES256"
    sse_algorithm = "aws:kms"
  }
}

variable "block_public_access" {
  description = "Block public access settings for the S3 bucket"
  type        = map(bool)
  default = {
    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
  }
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