provider "aws" {
    region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "my-tf-sr-first-bucket"
    key = "practice/jenkins-job/ami1/terraform.tfstate"
    region = "us-east-1"
  }
}
