data "terraform_remote_state" "vpc" {
 backend = "s3"
  config = {
    bucket = "otms-app-aptgetswag-bucket"
    key    = "env/dev/network-skeleton/vpc/vpc.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "subnets" {
  backend = "s3"
  config = {
    bucket = "otms-app-aptgetswag-bucket"
    key    = "env/dev/network-skeleton/subnets/subnets.tfstate"
    region = "us-east-1"
  }
}
