# Specify the provider and access details
# Note: change to profile instead of keys for security reasons
provider "aws" {
    region = var.aws_region
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
}