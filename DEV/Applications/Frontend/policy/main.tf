resource "aws_autoscaling_policy" "frontend_target_tracking" {
  name                   = var.asg_policy_name
  autoscaling_group_name = data.terraform_remote_state.asg.outputs.frontend_asg_name
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = var.target_cpu_utilization

   }

  lifecycle {
    create_before_destroy = true
  }
}
