# Terraform State Management Infrastructure
# This creates the GCS bucket and service accounts for managing Terraform state



# Create GCS bucket for Terraform state
module "terraform_state" {
  source = "../../modules/gcs"

  project_id    = var.project_id
  bucket_name   = var.gcs_bucket_name
  location      = var.storage_location
  force_destroy = false
  cors_origins  = []
}

# Create service account for Terraform operations
resource "google_service_account" "terraform_sa" {
  account_id   = "terraform-sa"
  display_name = "Service Account for Terraform operations"
  project      = var.project_id
}

# Grant Terraform service account necessary permissions
resource "google_project_iam_member" "terraform_admin" {
  project = var.project_id
  role    = "roles/editor"
  member  = "serviceAccount:${google_service_account.terraform_sa.email}"
}

resource "google_project_iam_member" "terraform_storage_admin" {
  project = var.project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.terraform_sa.email}"
}

resource "google_project_iam_member" "terraform_kubernetes_admin" {
  project = var.project_id
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.terraform_sa.email}"
}

# Create service account key for Terraform
resource "google_service_account_key" "terraform_sa_key" {
  service_account_id = google_service_account.terraform_sa.name
  public_key_type    = "TYPE_X509_PEM_FILE"
}

# Store the service account key in Secret Manager
resource "google_secret_manager_secret" "terraform_sa_key" {
  secret_id = "terraform-sa-key"
  project   = var.project_id

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "terraform_sa_key" {
  secret      = google_secret_manager_secret.terraform_sa_key.id
  secret_data = base64decode(google_service_account_key.terraform_sa_key.private_key)
}
