data "terraform_remote_state" "asg" {
  backend = "s3"
  config = {
    bucket = "otms-app-aptgetswag-bucket"
    key    = "env/dev/applications/frontend-api/asg.tfstate"
    region = "us-east-1"
  }
}
