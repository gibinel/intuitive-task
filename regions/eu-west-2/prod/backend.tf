terraform {
  backend "s3" {
    bucket         = "tfstate202404052300"
    key            = "eu-west-2/prod.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-state-lock-dynamo"
    encrypt        = true
  }
}
