data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = var.remote_state_bucket
    key    = var.vpc_state_key
    region = var.region
  }
}

data "terraform_remote_state" "subnets" {
  backend = "s3"
  config = {
    bucket = var.remote_state_bucket
    key    = var.subnet_state_key
    region = var.region
  }
}

data "terraform_remote_state" "natgateway" {
  backend = "s3"
  config = {
    bucket = var.remote_state_bucket
    key    = var.natgw_state_key
    region = var.region
  }
}

data "terraform_remote_state" "igw" {
  backend = "s3"
  config = {
    bucket = var.remote_state_bucket
    key    = var.igw_state_key
    region = var.region
  }
}
