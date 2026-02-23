data "terraform_remote_state" "alb" {
  backend = "s3"
  config = {
    bucket = "otms-app-aptgetswag-bucket"
    key    = "env/dev/network-skeleton/alb/alb.tfstate"
    region = "us-east-1"
  }
}


data "terraform_remote_state" "target_group" {
  backend = "s3"
  config = {
    bucket = "otms-app-aptgetswag-bucket"
    key    = "env/dev/applications/salary-api/target_group.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "listner_rule" {
  backend = "s3"
  config = {
    bucket = "otms-app-aptgetswag-bucket"
    key    = "env/dev/applications/frontend-api/listener_rules.tfstate"
    region = "us-east-1"
    
  }
}
