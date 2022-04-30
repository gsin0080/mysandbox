# Specify the provider and access details
# Note: change to profile instead of keys for security reasons
provider "aws" {
    region = var.aws_region
}