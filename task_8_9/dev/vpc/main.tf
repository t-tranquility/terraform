module "vpc" {
  source      = "../../modules/vpc"
  name_prefix = "dev-trainee-project"
  azs         = ["eu-north-1a", "eu-north-1b"]
  vpc_cidr    = "10.0.0.0/16"
}