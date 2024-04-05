terraform {
  backend "s3" {
    bucket         = "tfstate202404052300"
    key            = "eu-west-1/staging.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-state-lock-dynamo"
    encrypt        = true
  }
}
