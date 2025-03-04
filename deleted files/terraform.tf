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

module "vpc" {
  source      = "./modules/vpc"
  name_prefix = "terraform-task-8-9"
  azs         = ["eu-north-1a", "eu-north-1b"]
  vpc_cidr    = "10.0.0.0/16"
}



