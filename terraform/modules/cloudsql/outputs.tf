output "instance_name" {
  description = "The name of the database instance"
  value       = google_sql_database_instance.instance.name
}

output "instance_connection_name" {
  description = "The connection name of the database instance"
  value       = google_sql_database_instance.instance.connection_name
}

output "database_name" {
  description = "The name of the database"
  value       = google_sql_database.database.name
}

output "db_user" {
  description = "The database user"
  value       = google_sql_user.user.name
}

output "private_ip_address" {
  description = "The private IP address of the database instance"
  value       = google_sql_database_instance.instance.private_ip_address
}

output "secret_id" {
  description = "The ID of the secret containing the database password"
  value       = google_secret_manager_secret.db_password.id
} 