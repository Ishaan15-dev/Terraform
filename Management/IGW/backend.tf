terraform {
  backend "s3" {
    bucket  = "otms-app-aptgetswag-bucket"
    key = "env/dev/network-skeleton/igw/igw.tfstate"

    region  = "us-east-1"
    encrypt = true
  }
}
