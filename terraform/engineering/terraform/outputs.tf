# Outputs for Terraform State Management Infrastructure

output "terraform_state_bucket_name" {
  description = "The name of the Terraform state bucket"
  value       = module.terraform_state.bucket_name
}

output "terraform_state_bucket_url" {
  description = "The URL of the Terraform state bucket"
  value       = module.terraform_state.bucket_url
}

output "terraform_service_account_email" {
  description = "The email of the Terraform service account"
  value       = google_service_account.terraform_sa.email
}

output "terraform_service_account_key_secret_id" {
  description = "The ID of the secret containing the Terraform service account key"
  value       = google_secret_manager_secret.terraform_sa_key.id
} 