variable "environment" {
  default = "qa"
}

variable "aws_region" {
  default = "eu-west-1"
}

# variable "vpc_cidr" {}

# variable "subnet_cidrs" {}

# variable "security_groups" {}

# variable "instance_type" {}

variable "ami_id" {
  default = "ami-0e95d283a666c6ea0"
}

variable "bucket_name" {
  default = "qas3intuitive"
}

# variable "versioning" {}

# variable "block_public_access" {}

variable "lambda_function_name" {
  default = "qalambdaintuitive"
}

# variable "lambda_handler" {}

# variable "runtime" {}

variable "lambda_zip_path" {
  default = "../../../modules/lambda_package.zip"
}
