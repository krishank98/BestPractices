resource "aws_placement_group" "stage-apg" {
    name = "stage-apg"
    strategy = "cluster"
}

resource "auto_scaling_group" "stage-asg" {
    name = "stage-asg"
    max_size = 5
    min_size = 2
    healthcheck_check_grace_period = 300
    health_check_type = "ELB"
    desired_capacity = 2
    placement_group = aws_placement_group.stage-apg.id
    
}