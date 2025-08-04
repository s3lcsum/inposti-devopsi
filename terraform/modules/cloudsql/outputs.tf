# Outputs for the community Cloud SQL module

output "instance_name" {
  description = "The name of the database instance"
  value       = module.postgresql.instance_name
}

output "instance_connection_name" {
  description = "The connection name of the database instance"
  value       = module.postgresql.instance_connection_name
}

output "database_name" {
  description = "The name of the database"
  value       = var.database_name
}

output "db_user" {
  description = "The database user"
  value       = var.db_user
}

output "private_ip_address" {
  description = "The private IP address of the database instance"
  value       = module.postgresql.private_ip_address
}

output "secret_id" {
  description = "The ID of the secret containing the database password"
  value       = google_secret_manager_secret.db_password.id
}

# Additional outputs from community module
output "instance_self_link" {
  description = "The URI of the master instance"
  value       = module.postgresql.instance_self_link
}

output "instance_service_account_email_address" {
  description = "The service account email address assigned to the instance"
  value       = module.postgresql.instance_service_account_email_address
}
