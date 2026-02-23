resource "aws_autoscaling_group" "frontend_asg" {
  name                      = var.asg_name
  desired_capacity          = var.asg_desired_capacity
  max_size                  = var.asg_max_size
  min_size                  = var.asg_min_size
  vpc_zone_identifier       = [data.terraform_remote_state.subnets.outputs.frontend_private_subnet_id]
  health_check_type         = "EC2"
  health_check_grace_period = 300

  launch_template {
    id      = data.terraform_remote_state.lt.outputs.frontend_lt_id
    version = "$Latest"
  }


  target_group_arns = [
    data.terraform_remote_state.target-group.outputs.frontend_tg_arn
  ]




  dynamic "tag" {

    for_each = local.common_tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}
