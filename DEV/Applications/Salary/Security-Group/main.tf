resource "aws_security_group" "salary_sg" {
  name   = var.sg_salary
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  tags = merge(
    {
  },
  local.common_tags
  )
  #inbound rule
   dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
  
  #outbound rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

}
