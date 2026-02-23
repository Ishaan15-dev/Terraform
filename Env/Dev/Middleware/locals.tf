locals {
  common_tags = {
    env      = var.env
    owner    = var.owner_name
    tag_name = "${var.env}-${var.project_name}-${var.instance_name}_ec2"
  }
}
