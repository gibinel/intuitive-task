module "network" {
  source          = "../../../modules/network"
  aws_region      = var.aws_region
}

module "ec2" {
  source             = "../../../modules/ec2"
  aws_region         = var.aws_region
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  subnet_id          = module.network.subnet_ids[0]
  security_group_ids = module.network.security_group_id
  tags               = var.ec2_tags
}

module "s3" {
  source      = "../../../modules/s3"
  environment = var.environment
  aws_region  = var.aws_region
  bucket_name = var.bucket_name
  versioning  = var.versioning
}

module "lambda" {
  source               = "../../../modules/lambda"
  aws_region           = var.aws_region
  lambda_function_name = var.lambda_function_name
  s3_bucket_name       = module.s3.bucket_id
  lambda_handler       = var.lambda_handler
  runtime              = var.runtime
  lambda_zip_path      = var.lambda_zip_path
}
