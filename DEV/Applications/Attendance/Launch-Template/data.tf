# Subnets
data "terraform_remote_state" "subnets" {
  backend = "s3"
  config = {
    bucket = "otms-app-aptgetswag-bucket"
    key    = "env/dev/network-skeleton/subnets/subnets.tfstate"
    region = "us-east-1"
  }
}

# Security group
data "terraform_remote_state" "attendance_sg" {
  backend = "s3"
  config = {
    bucket = "otms-app-aptgetswag-bucket"
    key    = "env/dev/applications/attendance-api/sg.tfstate"
    region = "us-east-1"
  }
}

# SSH key
data "terraform_remote_state" "ssh_key" {
  backend = "s3"# Subnets
data "terraform_remote_state" "subnets" {
  backend = "s3"
  config = {
    bucket = "otms-app-aptgetswag-bucket"
    key    = "env/dev/network-skeleton/subnets/subnets.tfstate"
    region = "us-east-1"
  }
}

# Security group
data "terraform_remote_state" "attendance_sg" {
  backend = "s3"
  config = {
    bucket = "otms-app-aptgetswag-bucket"
    key    = "env/dev/applications/attendance-api/sg.tfstate"
    region = "us-east-1"
  }
}

# SSH key
data "terraform_remote_state" "ssh_key" {
  backend = "s3"
  config = {
    bucket = "otms-app-aptgetswag-bucket"
    key    = "env/dev/network-skeleton/ssh-key/ssh-key.tfstate"
    region = "us-east-1"
  }
}

# Latest Ubuntu AMI (22.04 LTS from Canonical)
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}
  config = {
    bucket = "otms-app-aptgetswag-bucket"
    key    = "env/dev/network-skeleton/ssh-key/ssh-key.tfstate"
    region = "us-east-1"
  }
}

# Latest Ubuntu AMI (22.04 LTS from Canonical)
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}
