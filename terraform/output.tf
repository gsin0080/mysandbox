output "instance_public_ip_addr" {    
    value = aws_instance.sandy[*].public_ip
}