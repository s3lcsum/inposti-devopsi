module "postgresql" {
  source  = "terraform-google-modules/sql-db/google//modules/postgresql"
  version = "26.1.1"

  name                = var.instance_name
  project_id          = var.project_id
  database_version    = "POSTGRES_14"
  region              = var.region
  tier                = var.machine_type
  disk_size           = var.disk_size
  disk_type           = "PD_SSD"
  deletion_protection = var.deletion_protection

  # Network configuration
  ip_configuration = {
    ipv4_enabled        = false
    private_network     = var.vpc_self_link
    require_ssl         = true
    allocated_ip_range  = null
    authorized_networks = []
  }

  # Backup configuration
  backup_configuration = {
    enabled                        = true
    start_time                     = "02:00"
    point_in_time_recovery_enabled = true
    transaction_log_retention_days = 7
    retained_backups               = 7
    retention_unit                 = "COUNT"
  }

  # Maintenance configuration
  maintenance_window_day          = 7
  maintenance_window_hour         = 2
  maintenance_window_update_track = "stable"

  # Database and user configuration
  # Note: database_name is not a direct argument, use additional_databases
  # user_name is not a direct argument, use additional_users

  # Additional databases
  additional_databases = [
    {
      name      = var.database_name
      charset   = "UTF8"
      collation = "en_US.UTF8"
    }
  ]

  # Additional users
  additional_users = [
    {
      name            = var.db_user
      password        = var.db_password
      host            = ""
      random_password = false
    }
  ]
}

# Create secrets for database connection details
resource "google_secret_manager_secret" "db_password" {
  secret_id = "${var.instance_name}-db-password"
  project   = var.project_id

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "db_password" {
  secret      = google_secret_manager_secret.db_password.id
  secret_data = var.db_password
}
