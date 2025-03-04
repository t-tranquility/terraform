terraform {

  required_providers {

    aws = {

      source = "hashicorp/aws"

      version = "> 5.8"

    }

  }

}

provider "aws" {
  region                   = "eu-north-1"
  shared_config_files      = ["/home/user/.aws/config"]
  shared_credentials_files = ["/home/user/.aws/credentials"]
  profile                  = "terraform"
  default_tags {
    tags = {
      Owner = "Terraform Terraformovich"
    }
  }
}
