resource "aws_internet_gateway" "Dev-Infra-IGW" {
 vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  tags = merge(
    {
      Name = "Dev-Infra-IGW"
    },
    local.common_tags
  )
}
