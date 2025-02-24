variable "region" {
  type    = string
  default = "eu-north-1"
}

variable "project_name" {
  type    = string
  default = "Terraform Terraformavich"
}

variable "env" {
  type = string
}

variable "instance_configs" {
  type = map(string)
  default = {
    backend  = "t3.micro"
    frontend = "t3.nano"
  }
}
