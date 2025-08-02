output "bucket_name" {
  description = "The name of the GCS bucket"
  value       = google_storage_bucket.bucket.name
}

output "bucket_url" {
  description = "The URL of the GCS bucket"
  value       = google_storage_bucket.bucket.url
}

output "service_account_email" {
  description = "The email of the service account"
  value       = google_service_account.storage_sa.email
}

output "service_account_key_secret_id" {
  description = "The ID of the secret containing the service account key"
  value       = google_secret_manager_secret.storage_sa_key.id
} 