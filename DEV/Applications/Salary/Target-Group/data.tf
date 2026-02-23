data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket  = "otms-app-aptgetswag-bucket"
    key     = "env/dev/network-skeleton/vpc/vpc.tfstate"
    region  = "us-east-1"
  }
}

data "terraform_remote_state" "salary_sg" {
  backend = "s3"
  config = {
   bucket  = "otms-app-aptgetswag-bucket"
   key     = "env/dev/applications/salary-api/sg.tfstate"
   region  = "us-east-1"
  }
  
}
# Remote state for subnets
data "terraform_remote_state" "subnets" {
  backend = "s3"
  config = {
    bucket = "otms-app-aptgetswag-bucket"
    key    = "env/dev/network-skeleton/subnets/subnets.tfstate"
    region = "us-east-1"
  }
}

# SSH key
data "terraform_remote_state" "ssh" {
  backend = "s3"  # or "local", "terraform cloud", etc.
  config = {
    bucket = "otms-app-aptgetswag-bucket"
    key    = "env/dev/network-skeleton/ssh-key/ssh-key.tfstate"
    region = "us-east-1"
  }
}
