module "network" {
  source             = "../../../modules/network"
  aws_region         = var.aws_region
  availability_zones = var.availability_zones
}

module "ec2" {
  source             = "../../../modules/ec2"
  environment        = var.environment
  aws_region         = var.aws_region
  ami_id             = var.ami_id
  subnet_id          = module.network.subnet_ids[0]
  security_group_ids = module.network.security_group_ids
}

module "s3" {
  source      = "../../../modules/s3"
  environment = var.environment
  aws_region  = var.aws_region
  bucket_name = var.bucket_name
}

module "lambda" {
  source               = "../../../modules/lambda"
  environment          = var.environment
  aws_region           = var.aws_region
  lambda_function_name = var.lambda_function_name
  bucket_name          = module.s3.bucket_name
  lambda_handler       = var.lambda_handler
  runtime              = var.runtime
  lambda_zip_path      = var.lambda_zip_path
}
