variable "name_prefix" {
  type = string
}

variable "azs" {
  type = list(string)
}

variable "vpc_cidr" {
  type = string
}
