terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.44.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
  # DOESN'T FUCKING WORK!!!!!
  # shared_config_files      = ["%USERPROFILE%\\.aws\\config"]
  # shared_credentials_files = ["%USERPROFILE%\\.aws\\credentials"]
}

resource "aws_s3_bucket" "tf_state" {
  bucket = "intuitivetfstate2024"
}

resource "aws_s3_bucket_ownership_controls" "s3_ownership" {
  bucket = aws_s3_bucket.tf_state.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "s3_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.s3_ownership]

  bucket = aws_s3_bucket.tf_state.id
  acl    = "private"
}

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name           = "terraform-state-lock-dynamo"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}
