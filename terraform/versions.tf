terraform {    
    required_version = "1.1.9"
    required_providers {
        aws = {
            version = "4.12.1"
            source = "hashicorp/aws"
        }
    }
}