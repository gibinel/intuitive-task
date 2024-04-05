variable "environment" {
  description = "Lamda enviroment"
  type        = string
}

variable "aws_region" {
  description = "AWS region for the Lambda function"
  type        = string
  default     = "us-east-1"
}

variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket that the Lambda function will access"
  type        = string
}

variable "lambda_handler" {
  description = "The function entrypoint in your code"
  type        = string
  default     = "lambda_function"
}

variable "runtime" {
  description = "The identifier of the function's runtime"
  type        = string
  default     = "python3.12"
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
