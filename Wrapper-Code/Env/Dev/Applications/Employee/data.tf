data "terraform_remote_state" "otms_ns_main" {
  backend = "s3"
  config = {
    bucket = "otms-env-dev-cloud-ops-crew"
    key    = "Network_skeleton/terraform.tfstate"
    region = "ap-southeast-1"
  }
}
data "aws_ami" "employee_ami" {
  most_recent = true
  filter {
    name   = "name"
    values = ["dev-Employee"]
  }
  owners = ["self"]
}
