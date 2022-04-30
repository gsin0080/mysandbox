# network.tf

# Fetch AZs in the current region
data "aws_availability_zones" "available"{
}

resource "aws_vpc" "mysandbox" {
    cidr_block = var.cidr_block
}

# Create var.az_count public subnets, each in a different AZ
resource "aws_subnet" "public" {
    count = var.az_count
    cidr_block = cidrsubnet(aws_vpc.mysandbox,8,count.index)
    available_zone = data.aws_availability_zones.names[count.index]
    vpc_id = aws_vpc.mysandbox.id
    map_public_ip_on_launch = true
}

# Create var.az_count private subnets, each in a different AZ
#resource "aws_subnet" "private" {
#    count = var.az_count
#    cidr_block = cidrsubnet(aws_vpc.mysandbox,8,var.az_count + count.index)
#    available_zone = data.aws_availability_zones.names[count.index]
#    vpc_id = aws_vpc.mysandbox.id
#}

# Internet Gateway for the public subnet
resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.mysandbox.id    
}

# Route the public subnet traffic through the IGW
resource "aws_route" "internet_access" {
    route_table_id = aws_vpc.mysandbox.main_route_table.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
}

# Create a NAT gateway with an Elastic IP for each private subnet to get internet connectivity
#resource "aws_eip" "gw" {
#    count = var.az_count
#    vpc = true
#    depends_on = [aws_internet_gateway.gw]
#}
#resource "aws_nat_gateway" "gw"{
#    count = var.az_count
#    subnet_id = element(aws_subnet.public.*.id,count.index)
#    allocation_id = element(aws.eip.gw.*.id, count.index)
#}
#resource "aws_route_table" "private" {
#    count = var.az_count
#    vpc_id = aws_vpc.mysandbox.id
#    route {
#        cidr_block = "0.0.0.0/0"
#        nat_gateway_id = element(aws_nat_gateway.gw.*.id,count.index)
#    }
#}
#resource "aws_route_table_association" "private" {
#    count = var.az_count
#    subnet_id = element(aws_subnet.private.*.id,count.index)
#    route_table_id = element(aws_route_table.private.*.id,count.index)
#}