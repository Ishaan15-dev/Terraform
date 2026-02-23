terraform {
  backend "s3" {
  bucket  = "otms-app-aptgetswag-bucket"
   key     = "env/dev/network-skeleton/natgateway/natgateway.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
