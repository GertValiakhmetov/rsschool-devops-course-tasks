terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws",
      version = "~> 5.68.0"
    }
  }

  backend "s3" {
    bucket         = "s3-bucket-rsschool-4451"
    key            = "terraform-state"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "dynamodb-lock"
  }

  required_version = ">= 1.9.6"
}

provider "aws" {
  region = "us-east-1"
}