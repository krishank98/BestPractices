resource "aws_vpc" "stage-vpc" {
    cidr_block="10.0.0.0/16"
    tags = {
        Name = "stagevpc"
        Environment="stage"
        Project="1"
    }
}

resource "aws_subnet" "stage-vpc-ps1"{
    vpc_id=aws_vpc.stage-vpc.id
    cidr_block=10.0.1.0/24
    tags = {
        Name= "stage-vpc-public-subnet-1"
        Environment="stage"
        Project="1"
    }
}

resource "aws_subnet" "stage-vpc-ps2"{
    vpc_id=aws_vpc.stage-vpc.id
    cidr_block=10.0.2.0/24
    tags = {
        Name= "stage-vpc-public-subnet-2"
        Environment="stage"
        Project="1"
    }
}

resource "aws_subnet" "stage-vpc-ps3"{
    vpc_id=aws_vpc.stage-vpc.id
    cidr_block=10.0.3.0/24
    tags = {
        Name= "stage-vpc-public-subnet-3"
        Environment="stage"
        Project="1"
    }
}

resource "aws_subnet" "stage-vpc-pvs1"{
    vpc_id=aws_vpc.stage-vpc.id
    cidr_block=10.0.4.0/24
    tags = {
        Name= "stage-vpc-private-subnet-1"
        Environment="stage"
        Project="1"
    }
}

resource "aws_subnet" "stage-vpc-pvs2"{
    vpc_id=aws_vpc.stage-vpc.id
    cidr_block=10.0.5.0/24
    tags = {
        Name= "stage-vpc-private-subnet-2"
        Environment="stage"
        Project="1"
    }
}

resource "aws_subnet" "stage-vpc-pvs3"{
    vpc_id=aws_vpc.stage-vpc.id
    cidr_block=10.0.6.0/24
    tags = {
        Name= "stage-vpc-private-subnet-3"
        Environment="stage"
        Project="1"
    }
}

resource "aws_route_table" "stage-vpc-public-route-table" {
    vpc_id=aws_vpc.stage-vpc.id

      tags = {
        Name= "stage-vpc-public-routetable"
        Environment="stage"
        Project="1"
    }
}

resource "aws_route_table" "stage-vpc-private-route-table" {
    vpc_id=aws_vpc.stage-vpc.id

      tags = {
        Name= "stage-vpc-private-routetable"
        Environment="stage"
        Project="1"
    }
}
