terraform {
  backend "s3" {
  bucket  = "otms-app-aptgetswag-bucket"
   key     = "env/dev/applications/salary-api/target_group.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
