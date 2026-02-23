# ─────────── General Configuration ───────────
aws_region          = "ap-southeast-1"
env                 = "dev"
project_name        = "OTMS"
instance_name       = "Postgresdb"
owner_name          = "Cloudops-crew"

# ─────────── EC2 Configuration ───────────
number_of_instances = 1
instance_type       = "t3.micro"
key_name            = "API-KEY"
ami_id              = "ami-0555f793950f1c389"
private_ip          = "10.0.1.10"

# ─────────── Networking (from your remote state outputs) ───────────
subnet_id           = "subnet-03da97e7aaa110757"
security_groups     = ["sg-0ee43008ef4e736ed"]

# ─────────── EBS Configuration ───────────
ebs_volume_size     = 30
ebs_volume_type     = "gp2"
