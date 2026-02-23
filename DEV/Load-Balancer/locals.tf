locals {
  application = "otms"
  owner       = "apt-get-swag"
  env         = "dev"
  cost_center = "CC-101"



  common_tags = {
    Application = local.application
    Owner       = local.owner
    Environment = local.env
    CostCenter  = local.cost_center

  }

}
