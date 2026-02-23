module "postgresdb" {
  source              = "git::https://nitinsharma-mygurukulum:ghp s5jmO@github.com/Snaatak-Cloudops-Crew/IAC-Terraform-repo.git//Terraform/Modules/Infra/Standalone-vm?ref=SCRUM-493-abhishek"
  project_name        = var.project_name
  instance_name       = var.instance_name
  ami_id              = data.aws_ami.dev_postgres.id
  instance_type       = var.instance_type
  key_name            = var.key_name
  subnet_id           = data.terraform_remote_state.otms_vpc.outputs.private_subnet_ids[0]
  security_groups     = [data.terraform_remote_state.otms_vpc.outputs.security_group_ids["postgresql"]]
  env                 = var.env
  aws_region          = var.aws_region
  owner_name          = var.owner_name
  ebs_volume_size     = 30
  ebs_volume_type     = "gp2"
  private_ip          = "10.0.1.10" # Pick an unused IP from the subnet range (10.0.1.0/24 etc.)
  number_of_instances = 1
}
