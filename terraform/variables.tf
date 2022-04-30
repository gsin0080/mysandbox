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

variable "associate_public_ip_address" {
  description = "Associate a public IP address to the EC2 instance"
  default     = true
}

variable "root_volume_size" {
  description = "Volume size of root volume of Linux Server"
  default = 20
}

variable "linux_data_volume_size" {
  type        = number
  description = "Volume size of data volume of Linux Server"
  default = 10
}

variable "linux_root_volume_type" {
  type        = string
  description = "Volume type of root volume of Linux Server."
  default     = "gp2"
}

variable "linux_data_volume_type" {
  type        = string
  description = "Volume type of data volume of Linux Server"
  default     = "gp2"
}


variable "office_cidr_block" {
    description = "office cidr block"
    default = ["0.0.0.0/0"]
}

#variable "aws_access_key" {
#    description = "Use your aws access key"
#}

#variable "aws_secret_key" {
#    description = "Use your aws secret key"
#}