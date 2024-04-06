variable "environment" {
  description = "Test deploy 1"
  default = "prod"
}

variable "aws_region" {
  default = "eu-west-1"
}

variable "availability_zones" {
  description = "List of availability zones in the AWS region"
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}

variable "ami_id" {
  default = "ami-0e95d283a666c6ea0"
}

variable "bucket_name" {
  default = "prod.eu-west-1.s3intuitive"
}

variable "lambda_function_name" {
  default = "prodlambdaintuitive"
}

variable "lambda_handler" {
  default = "lambda_package/rolecall.lambda_handler"
}

variable "runtime" {
  default = "python3.12"
}

variable "lambda_zip_path" {
  default = "lambda_package.zip"
}
