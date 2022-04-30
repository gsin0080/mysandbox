# variables.tf 

variable "aws_region" {
    description = "The AWS region for this project is created in"
    default = "ap-southeast-2"
}

variable "cidr_block" {
    description = "VPC cidr block"
    default = "10.0.0.0/16"
}

variable "app_port" {
    description = "Application port"
    default = "80"
}

variable "az_count" {
    description = "Number of AZs to cover in a given region"
    default = 1
}

variable "ec2_instance_type" {
    description = "EC2 instance type"
    default = "t2.micro"
}

variable "ec2_ami" {
    description = "AMI for EC2 OS"
    default = "ami-0b7dcd6e6fd797935"
}

variable "office_cidr_block" {
    description = "office cidr block"
    default = ["0.0.0.0/0"]
}

variable "aws_access_key" {
    description = "Use your aws access key"
}

variable "aws_secret_key" {
    description = "Use your aws secret key"
}