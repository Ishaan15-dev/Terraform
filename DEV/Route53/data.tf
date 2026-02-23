data "terraform_remote_state" "alb" {
  backend = "s3"
  config = {
    bucket = "otms-app-aptgetswag-bucket"
    key    = "env/dev/network-skeleton/alb/alb.tfstate"  # path to your ALB tfstate
    region = "us-east-1"
  }
}
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "otms-app-aptgetswag-bucket"
    key    = "env/dev/network-skeleton/vpc/vpc.tfstate"  # path to your VPC tfstate
    region = "us-east-1"
  }
}
