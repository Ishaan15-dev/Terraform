locals {
  common_tags = {
    Application = var.application
    Owner       = var.owner
    Environment = var.env
    CostCenter  = var.cost_center
  }

  lt_tags = merge(local.common_tags, {
    Name = "${var.env}-frontend-lt"
  })

  asg_tags = [
    for tag_key, tag_value in local.common_tags : {
      key                 = tag_key
      value               = tostring(tag_value)
      propagate_at_launch = true
    }
  ]

  tg_tags = merge(local.common_tags, {
    Name = "${var.env}-frontend-tg"
  })

  lr_tags = merge(local.common_tags, {
    Name = "${var.env}-frontend-lr"
  })
}
