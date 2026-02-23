module "redis" {
  source = "git::https://Aryanmishra-2:gh70El156@github.com/Snaatak-Cloudops-Crew/IAC-Terraform-repo.git//Terraform/Modules/Infra/Standalone-vm?ref=SCRUM-493-abhishek"

  project_name          = var.project_name
  instance_name         = var.instance_name
  ami_id                = data.aws_ami.dev-redis.id
  instance_type         = var.instance_type
  key_name              = var.key_name
  subnet_id             = data.terraform_remote_state.otms_vpc.outputs.private_subnet_ids[0] # first subnet
  security_groups       = [data.terraform_remote_state.otms_vpc.outputs.security_group_ids["redis"]]
  env                   = var.env
  aws_region            = var.aws_region
  owner_name            = var.owner_name
  device_name           = "/dev/sda1"
  ebs_volume_size       = 30
  ebs_volume_type       = "gp2"
  delete_on_termination = true
  allocate_eip          = false
  eip_domain            = "vpc"
  number_of_instances   = var.number_of_instances
  private_ip            = null
}
