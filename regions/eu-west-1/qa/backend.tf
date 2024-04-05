terraform {
  backend "s3" {
    bucket         = "intuitivetfstate2024"
    key            = "${var.environment}/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "my-lock-table"
    encrypt        = true
  }
}
