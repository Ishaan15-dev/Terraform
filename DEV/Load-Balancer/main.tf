resource "aws_security_group" "alb_sg" {
  name        = "alb-sg"
  description = "Security group for internet-facing ALB"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

dynamic "ingress" {
  for_each = var.ingress_rules
  content {
   from_port   = ingress.value.from_port
    to_port     = ingress.value.to_port
    protocol    = ingress.value.protocol
    cidr_blocks = ingress.value.cidr_blocks
}
}

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}


resource "aws_lb" "app_alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  subnets            = [ data.terraform_remote_state.subnets.outputs.public_subnet_1,
    data.terraform_remote_state.subnets.outputs.public_subnet_2 ]
  security_groups    = [aws_security_group.alb_sg.id]

tags = local.common_tags
}
