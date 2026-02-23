terraform {
  backend "s3" {
  bucket  = "otms-app-aptgetswag-bucket"
   key     = "env/dev/applications/salary-api/alb_listener_rule.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
