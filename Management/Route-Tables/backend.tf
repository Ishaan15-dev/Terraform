terraform {
  backend "s3" {
    bucket         = "otms-app-aptgetswag-bucket"
    key            = "env/dev/network-skeleton/rt/rt.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
