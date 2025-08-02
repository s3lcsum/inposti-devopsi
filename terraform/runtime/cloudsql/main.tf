# CloudSQL Infrastructure for Runtime Environment
# This creates the CloudSQL PostgreSQL instance for the application

# Use existing networking infrastructure
# Note: VPC should be created by terraform/networking/ first
# This configuration assumes the networking infrastructure is already deployed

# Create the CloudSQL infrastructure
module "cloudsql" {
  source = "../../modules/cloudsql"

  project_id       = var.project_id
  instance_name    = var.cloudsql_instance_name
  database_name    = var.cloudsql_name
  db_user          = var.cloudsql_user
  db_password      = var.cloudsql_password
  region           = var.region
  machine_type     = var.cloudsql_machine_type
  disk_size        = var.cloudsql_disk_size
  vpc_self_link    = "https://www.googleapis.com/compute/v1/projects/${var.project_id}/global/networks/runtime-vpc"
  deletion_protection = var.cloudsql_deletion_protection
} 