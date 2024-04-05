terraform {
  backend "s3" {
    bucket         = "intuitivetfstate2024"
    key            = "eu-west-1/qa.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-state-lock-dynamo"
    encrypt        = true
  }
}
