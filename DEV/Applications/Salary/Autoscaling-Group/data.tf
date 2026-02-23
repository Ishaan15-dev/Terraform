data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket  = "otms-app-aptgetswag-bucket"
    key     = "env/dev/network-skeleton/vpc/vpc.tfstate"
    region  = "us-east-1"
  }
}

data "terraform_remote_state" "salary_sg" {
  backend = "s3"
  config = {
    bucket  = "otms-app-aptgetswag-bucket"
    key     = "env/dev/applications/salary-api/sg.tfstate"
    region  = "us-east-1"
  }
  
}
# Remote state for subnets
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
    key    = "env/dev/applications/salary-api/target_group.tfstate"
    region = "us-east-1"

  }
}

data "terraform_remote_state" "lt" {
  backend = "s3"
  config = {
    bucket = "otms-app-aptgetswag-bucket"
    key    = "env/dev/applications/salary-api/launch_template.tfstate"
    region = "us-east-1"
  }
}
