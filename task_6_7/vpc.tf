data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  azs = data.aws_availability_zones.available.names
}
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"
  azs  = local.azs

  # private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets = [for k, v in local.azs : cidrsubnet("10.0.0.0/16", 8, k + 4)]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
