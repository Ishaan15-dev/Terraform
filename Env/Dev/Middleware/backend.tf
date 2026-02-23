terraform {
  backend "s3" {
    bucket = "otms-env-dev-cloud-ops-crew"
    key    = "Env/Dev/Module/Databases/Redis/terraform.tfstate"
    region = "ap-southeast-1"
  }
}
