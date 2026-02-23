terraform {
  backend "s3" {
  bucket  = "otms-app-aptgetswag-bucket"
   key     = "env/dev/network-skeleton/route-53/route-53.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
