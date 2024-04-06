variable "environment" {
  description = "Lamda enviroment"
  type        = string
}

variable "aws_region" {
  description = "AWS region for the Lambda function"
  type        = string
}

variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "bucket_name" {
  description = "The name of the S3 bucket that the Lambda function will access"
  type        = string
}

variable "kms_key_arn" {
  description = "ARN of the S3 KMS key"
  type        = string
}

variable "lambda_handler" {
  description = "The function entrypoint in your code"
  type        = string
}

variable "runtime" {
  description = "The identifier of the function's runtime"
  type        = string
}

variable "lambda_zip_path" {
  description = "Path to the zip file containing your Lambda function code"
  type        = string
}

variable "created_by" {
  description = "Created by Terraform tag"
  default     = "terraform"
}

locals {
  required_tags = {
    "Environment" = var.environment,
    "Created by"  = var.created_by
  }
}
