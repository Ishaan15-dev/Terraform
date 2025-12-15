terraform {
  backend "s3" {
    bucket = "amzn-s3-task-1"
    key    = "site/terraform.tfstate"
    region = "ap-south-1"
  }
}
