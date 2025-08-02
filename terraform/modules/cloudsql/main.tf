# Database Module for Google Cloud SQL
# This module creates a PostgreSQL instance for the web application

resource "google_sql_database_instance" "instance" {
  name             = var.instance_name
  database_version = "POSTGRES_14"
  region           = var.region
  project          = var.project_id

  settings {
    tier = var.machine_type
    
    backup_configuration {
      enabled                        = true
      start_time                     = "02:00"
      point_in_time_recovery_enabled = true
      transaction_log_retention_days = 7
      backup_retention_settings {
        retained_backups = 7
      }
    }

    ip_configuration {
      ipv4_enabled    = false
      private_network = var.vpc_self_link
      ssl_mode        = "ENCRYPTED_ONLY"
    }

    maintenance_window {
      day          = 7  # Sunday
      hour         = 2  # 2 AM
      update_track = "stable"
    }

    disk_size = var.disk_size
    disk_type = "PD_SSD"
  }

  deletion_protection = var.deletion_protection
}

resource "google_sql_database" "database" {
  name     = var.database_name
  instance = google_sql_database_instance.instance.name
  project  = var.project_id
}

resource "google_sql_user" "user" {
  name     = var.db_user
  instance = google_sql_database_instance.instance.name
  password = var.db_password
  project  = var.project_id
}

# Create a secret for the database password
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