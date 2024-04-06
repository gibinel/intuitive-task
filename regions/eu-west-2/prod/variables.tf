variable "environment" {
  default = "prod"
}

variable "aws_region" {
  default = "eu-west-2"
}

variable "availability_zones" {
  description = "List of availability zones in the AWS region"
  type        = list(string)
  default     = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}

variable "ami_id" {
  default = "ami-0b9f4b4ee3d0e6a17"
}

variable "bucket_name" {
  default = "prods3intuitive"
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
