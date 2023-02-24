resource "aws_instance" "my_instance" {
    ami = "ami-0caf778a172362f1c"
    instance_type = "t2.micro"
    count = 1
    key_name= "stage-key"
    subnet_id = aws_subnet.stage-vpc-ps1.id
    vpc_security_group_ids = [aws_security_group.stage-sg.id]
    associate_public_ip_address = true
    tags ={
        Name = "my_instance"
        Type = "Ubuntu"
        Env = "Stage"
    }
}