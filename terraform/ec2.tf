# Create EC2 Instance

resource "aws_instance" "sandy" {
    count = var.az_count
    ami = var.ec2_ami
    instance_type = var.ec2_instance_type
    subnet_id = aws_subnet.public[count.index].id
    vpc_security_group_ids = [aws_security_group.sandbox.id]
    associate_public_ip_address = var.associate_public_ip_address
    source_dest_check = false
    key_name = aws_key_pair.key_pair.key_name
    #user_data = file("aws-user-data.sh")
    
    # root disk
    root_block_device {
        volume_size = var.root_volume_size
        volume_type = var.root_volume_type
        delete_on_termination = true
        encrypted = true
    }
    # extra disk
    ebs_block_device {
        device_name = "/dev/xvda"
        volume_size = var.data_volume_size
        volume_type = var.data_volume_type
        encrypted = true
        delete_on_termination = true
    }
    
    tags = {
        Name = "sandy-vm"
    }
}