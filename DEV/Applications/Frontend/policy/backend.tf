terraform {
  backend "s3" {
    bucket  = "otms-app-aptgetswag-bucket"
    key     = "env/dev/applications/frontend-api/scaling_policies.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
