terraform {
  backend "s3" {
  bucket  = "otms-app-aptgetswag-bucket"
   key     = "env/dev/applications/salary-api/auto_scaling_group.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
