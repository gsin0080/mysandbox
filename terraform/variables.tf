# variables.tf 

variable "aws_region" {
    description = "The AWS region for this project is created in"
    default = "ap-southeast-2"
}

variable "cidr_block" {
    description = "VPC cidr block"
    default = "10.0.0.0/24"
}

variable "app_port" {
    description = "Application port"
    defualt = "80"
}