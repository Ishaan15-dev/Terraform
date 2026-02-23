terraform {
  backend "s3" {
    bucket  = "otms-app-aptgetswag-bucket"
    key     = "env/dev/applications/attendance-api/asg-policies.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
