terraform {
  backend "s3" {
    bucket  = "otms-app-aptgetswag-bucket"
    key     = "env/dev/network-skeleton/alb/alb.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
