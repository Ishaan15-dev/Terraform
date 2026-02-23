resource "aws_lb_listener_rule" "attendance_listener_rule" {
  listener_arn = data.terraform_remote_state.listner_rule.outputs.frontend_listener_arn
  priority     = var.listener_rule_priority

  action {
    type             = "forward"
    target_group_arn = data.terraform_remote_state.target_group.outputs.salary_tg_arn
  }

  condition {
    path_pattern {
      values = local.salary_paths
    }
  }

  tags = local.common_tags
}
