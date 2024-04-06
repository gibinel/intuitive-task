# Pipeline: GitHub Actions

This workflow installs the latest version of Terraform CLI.
On pull request events, this workflow will run `terraform init`, `terraform fmt`, and `terraform plan` (speculative plan via Terraform Cloud).
On push events to the "main" branch, `terraform apply` will be executed.

This is just POC pipeline, only works for 'PROD' changes (theoretically the main branch would be used for PROD).
There is a lot more work in order to have a production ready solution with multiple workflows and reusable workflows.
