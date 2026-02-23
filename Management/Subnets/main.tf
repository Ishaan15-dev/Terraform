resource "aws_subnet" "public" {
  for_each = { for s in var.public_subnets : s.name => s }

  vpc_id                  = data.terraform_remote_state.vpc.outputs.vpc_id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az
  map_public_ip_on_launch = true

  tags = merge(
    local.common_tags,
    {
      Name = each.value.name
      Type = "public"
    }
  )
}

resource "aws_subnet" "private" {
  for_each = { for s in var.private_subnets : s.name => s }

  vpc_id                  = data.terraform_remote_state.vpc.outputs.vpc_id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az
  map_public_ip_on_launch = false

  tags = merge(
    local.common_tags,
    {
      Name = each.value.name
      Type = "private"
    }
  )
}
