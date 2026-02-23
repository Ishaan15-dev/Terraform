aws_region = "us-east-1"

availability_zones = ["us-east-1a", "us-east-1b"]

# Public subnets (~1000 IPs each → /22)
public_subnets = [
  {
    name = "otms-dev-public-subnet-01"
    cidr = "10.0.0.0/22"
    az   = "us-east-1a"
  },
  {
    name = "otms-dev-public-subnet-02"
    cidr = "10.0.4.0/22"
    az   = "us-east-1b"
  }
]

# Private subnets
private_subnets = [
  {
    name = "otms-dev-api-private-subnet"
    cidr = "10.0.8.0/21"      
    az   = "us-east-1b"
  },
  {
    name = "otms-dev-frontend-private-subnet"
    cidr = "10.0.16.0/22"     
    az   = "us-east-1b"      
  },
  {
    name = "otms-dev-db-private-subnet"
    cidr = "10.0.20.0/22"     
    az   = "us-east-1b"
  }
]
