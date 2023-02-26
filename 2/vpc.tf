resource "aws_vpc" "vpc"{
    cidr_block = var.vpc_cidr
    enable_dns_hostnames= true

    tags = {
        Name = "STAGEVPC-stageproject"
    }
}

data "aws_availability_zones" "all" {
    state = "available"
}

resource "aws_subnet" "public_ap_south_1a" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.subnet1_cidr
    availability_zone = data.aws_availability_zones.all.names[0]

    tags = {
        Name = "publicsubnet-stageproject"
    }
}

resource "aws_internet_gateway" "igw" {
vpc_id = aws_vpc.vpc.id

tags = {
    Name = "STAGEIGW-STAGEPROJECT"
 }
}

resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = "STAGEPUBLIC_ROUTETABLE_STAGEPROJECT"
    }
}

resource "aws_route_table_association" "vpc_ap_south_1a_public" {
    subnet_id = aws_subnet.public_ap_south_1a.id
    route_table_id = aws_route_table.public_route_table.id
}

resource "aws_security_group" "instance_sg" {
    name = " common_sg_for_instance"
    vpc_id = aws_vpc.vpc.id

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22 
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
     ingress {
        from_port = 80 
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

     ingress {
        from_port = 8080 
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
     ingress {
        from_port = 443 
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
