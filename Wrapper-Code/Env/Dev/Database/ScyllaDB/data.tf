
data "terraform_remote_state" "otms_vpc" {
  backend = "s3"

  config = {
    bucket = "otms-env-dev-cloud-ops-crew"
    key    = "Network_skeleton/terraform.tfstate"
    region = "ap-southeast-1"
  }
}


data "aws_ami" "dev-scyalldb" {
  filter {
    name   = "name"
    values = ["dev-scyalldb"]
  }
}
