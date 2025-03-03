terraform {

  required_providers {

    aws = {

      source = "hashicorp/aws"

      version = "> 5.8"

    }

  }

}

provider "aws" {
  region                   = var.region
  shared_config_files      = ["/home/user/.aws/config"]
  shared_credentials_files = ["/home/user/.aws/credentials"]
  profile                  = "terraform"
  default_tags {
    tags = {
      Owner = "Terraform Terraformovich"
    }
  }
}


 