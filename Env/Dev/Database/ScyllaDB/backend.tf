terraform {
  backend "s3" {
    bucket = "otms-env-dev-cloud-ops-crew"
    key    = "Env/Dev/Module/Databases/Scylladb/terraform.tfstate"
    region = "ap-southeast-1"
  }
}
