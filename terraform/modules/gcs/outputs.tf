# Outputs for the community GCS module

output "bucket_name" {
  description = "The name of the GCS bucket"
  value       = module.gcs_buckets.names[0]
}

output "bucket_url" {
  description = "The URL of the GCS bucket"
  value       = module.gcs_buckets.urls[0]
}

output "service_account_email" {
  description = "The email of the service account"
  value       = google_service_account.storage_sa.email
}

output "service_account_key_secret_id" {
  description = "The ID of the secret containing the service account key"
  value       = google_secret_manager_secret.storage_sa_key.id
}

# Additional outputs from the community module
output "bucket" {
  description = "Bucket resource (for single use)."
  value       = module.gcs_buckets.bucket
}

output "buckets" {
  description = "Bucket resources as list."
  value       = module.gcs_buckets.buckets
}

output "names" {
  description = "Bucket names."
  value       = module.gcs_buckets.names
}

output "urls" {
  description = "Bucket URLs."
  value       = module.gcs_buckets.urls
}
