locals {
  # Basic project info
  application = "otms"
  owner       = "apt-get-swag"
  env         = "dev"
  cost_center = "CC-101"

  # Common tags for all resources
  common_tags = {
    Application = local.application
    Owner       = local.owner
    Environment = local.env
    CostCenter  = local.cost_center
  }

  # merge common_tags with extra tags from tfvars
  tags_map = merge(
    local.common_tags,
    var.tags_map    # terraform.tfvars se additional tags
  )
}
