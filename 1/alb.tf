resource "aws_lb" "stage-alb" {
    name = "stage-alb"
    internal= false 
    load_balancer_type = "application"
    security_groups= [aws_security_group.alb-sg.id]
    subnets = [aws_subnet.stage-vpc-ps1.id,aws_subnet.stage-vpc-ps2.id]
    enable_deletion_protection = false
    
    tags = {
        Name = "stage-alb"
        Environment = "stage"
    }
}

resource "aws_lb_target_group" "aws_alb-tg"{
    name = "stage-alb-tg"
    port= 80
    protocol = "HTTP"
    vpc_id = aws_vpc.stage-vpc.id
}

resource "aws_lb_target_group_attachment" "tg-attach1" {
    target_group_arn = aws_lb_target_group.aws_alb-tg.arn
    target_id = aws_instance.my_instance1.id
    port = 80

    depends_on = [
        aws_instance.my_instance1
    ]
}

resource "aws_lb_target_group_attachment" "tg-attach2" {
    target_group_arn = aws_lb_target_group.aws_alb-tg.arn
    target_id = aws_instance.my_instance2.id
    port = 80

    depends_on = [
        aws_instance.my_instance2
    ]
}

resource "aws_lb_listener" "alb-listners" {
    load_balancer_arn = aws_lb.stage-alb.arn
    port = "80"
    protocol = "HTTP"
    
    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.aws_alb-tg.arn
    }
}