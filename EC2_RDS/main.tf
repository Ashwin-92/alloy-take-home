terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "Terraform_iam_user"
  region  = "us-east-1"
   access_key="AKIAZAR64TJOIFAXV22F"
  secret_key="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"
}

module "VPC_Module" {
    source = "./VPC_Module/"
    vpc_name = "Ash-VPC"

}
