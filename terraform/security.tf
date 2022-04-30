# security.tf

resource "aws_security_group" "sandbox" {
    name = "sandbox-security-group"
    description = "Control access to the sandbox vpc"
    vpc_id = aws_vpc.mysandbox.id

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = var.office_cidr_block
    }

    # Allow access to Nginx  
    ingress {
        from_port = app_port
        to_port = app_port
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}