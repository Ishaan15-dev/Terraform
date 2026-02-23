data "terraform_remote_state" "lt" {
  backend = "s3"
  config = {
    bucket = "otms-app-aptgetswag-bucket"
    key    = "env/dev/applications/attendance-api/launch_template.tfstate"
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


data "terraform_remote_state" "target-group" {
  backend = "s3"
  config = {
    bucket = "otms-app-aptgetswag-bucket"
    key    = "env/dev/applications/attendance-api/target_group.tfstate"
    region = "us-east-1"

  }
}
