# Outputs for CloudSQL Runtime Infrastructure

output "cloudsql_instance_name" {
  description = "The name of the CloudSQL instance"
  value       = module.cloudsql.instance_name
}

output "cloudsql_connection_name" {
  description = "The connection name of the CloudSQL instance"
  value       = module.cloudsql.instance_connection_name
}

output "cloudsql_private_ip" {
  description = "The private IP address of the CloudSQL instance"
  value       = module.cloudsql.private_ip_address
} 