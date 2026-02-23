resource "aws_launch_template" "salary_lt" {
  name          = var.launch_template_name
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = data.terraform_remote_state.ssh.outputs.ssh_key_name

  network_interfaces {
    subnet_id                   = data.terraform_remote_state.subnets.outputs.api_private_subnet_id
    associate_public_ip_address = false
    security_groups             = [data.terraform_remote_state.salary_sg.outputs.salary_sg_id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = merge(
      local.common_tags,
      { Name = var.instance_name }
    )
  }
}
