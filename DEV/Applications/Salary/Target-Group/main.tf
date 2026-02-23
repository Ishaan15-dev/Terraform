resource "aws_lb_target_group" "salary_tg" {
  name     = var.tg_name
  port     = var.tg_port
  protocol = var.tg_protocol
  vpc_id   = data.terraform_remote_state.vpc.outputs.vpc_id

  health_check {
    path = var.tg_health_check_path
  }

  tags = local.common_tags
}
