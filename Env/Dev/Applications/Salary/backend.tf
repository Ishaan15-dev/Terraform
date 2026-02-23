terraform {
  backend "s3" {
    bucket = "otms-my-bucket"
    key    = "Env/Dev/Module/Applications/Salary-App-Infra/terraform.tfstate"
    region = "ap-southeast-1"
  }
}
