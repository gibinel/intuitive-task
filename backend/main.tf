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
  region                   = "eu-central-1"
  # DOESN'T FUCKING WORK!!!!!
  # shared_config_files      = ["%USERPROFILE%\\.aws\\config"]
  # shared_credentials_files = ["%USERPROFILE%\\.aws\\credentials"]
}

resource "aws_s3_bucket" "tf_state" {
  bucket = "intuitivetfstate2024"
  acl    = "private"
}
