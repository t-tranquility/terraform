data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    profile        = "terraform"
    bucket         = "trainee-project-rudko-anna-task-8-9-terraform"
    key            = "dev/vpc.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "task_terraform"
  }
}
