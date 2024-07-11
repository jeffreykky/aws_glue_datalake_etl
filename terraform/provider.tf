terraform {

  backend "s3"{
    bucket                 = "terraform-standard-datalake-etl-terraform-backend"
    region                 = "us-east-1"
    key                    = "backend.tfstate"
    dynamodb_table         = "terraform-backend"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.57"
    }
  }
}

provider "aws" {
}