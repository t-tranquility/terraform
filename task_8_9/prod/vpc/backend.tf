terraform {
  backend "s3" {
    bucket         = "trainee-project-rudko-anna-task-8-9-terraform"
    key            = "prod/vpc.tfstate"
    region         = "eu-north-1"
    profile        = "terraform"
    dynamodb_table = "task_terraform"
    encrypt        = true
  }
}
