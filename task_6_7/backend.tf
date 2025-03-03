terraform {
   backend "s3" {
      bucket = "trainee-project-rudko-anna-task6-7-tfstate" 
      key = "terraform.tfstate" 
      region = "eu-north-1" 
      profile = "terraform"
      dynamodb_table = "My-table-terraform-task-6-7" 
      encrypt = true 
   }
}
