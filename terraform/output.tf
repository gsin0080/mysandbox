output "instance_public_ip_addr" {
    count = var.az_count
    value = aws_instance.sandy[count.index].public_ip
}