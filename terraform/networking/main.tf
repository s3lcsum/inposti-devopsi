# Networking Infrastructure
# This creates the basic VPC infrastructure for both engineering and runtime environments



# Create Engineering VPC
module "engineering_vpc" {
  source = "../modules/vpc"

  project_id = var.project_id
  vpc_name   = "engineering-vpc"
  subnets = [
    {
      name          = "engineering-subnet"
      ip_cidr_range = "10.0.10.0/24"
      region        = var.region
    }
  ]
}

# Create Runtime VP
module "runtime_vpc" {
  source = "../modules/vpc"

  project_id = var.project_id
  vpc_name   = "runtime-vpc"
  subnets = [
    {
      name          = "runtime-subnet"
      ip_cidr_range = "10.0.20.0/24"
      region        = var.region
    }
  ]
}

# Setup VPC peering between environments
module "networking" {
  source = "../modules/networking"

  project_id                = var.project_id
  engineering_vpc_self_link = module.engineering_vpc.vpc_self_link
  runtime_vpc_self_link     = module.runtime_vpc.vpc_self_link
  engineering_vpc_name      = module.engineering_vpc.vpc_name
  runtime_vpc_name          = module.runtime_vpc.vpc_name
  engineering_subnet_cidr   = "10.0.10.0/24"
  runtime_subnet_cidr       = "10.0.20.0/24"
}
