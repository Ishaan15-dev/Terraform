environment        = "dev"
owner              = "apt-get-swag"
region             = "us-east-1"
project_name       = "otms"



# Remote State Config  
remote_state_bucket = "otms-app-aptgetswag-bucket"
vpc_state_key       = "env/dev/network-skeleton/vpc/vpc.tfstate"
subnet_state_key    = "env/dev/network-skeleton/subnets/subnets.tfstate"
natgw_state_key     = "env/dev/network-skeleton/natgateway/natgateway.tfstate"
igw_state_key       = "env/dev/network-skeleton/igw/igw.tfstate"

# Output keys from remote states
igw_output_name     = "Dev-Infra-IGW"
natgw_output_name   = "dev_infra_pub_nat"
