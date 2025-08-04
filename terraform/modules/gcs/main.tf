# GCS Module using Community Module
# This module creates a GCS bucket using the official terraform-google-modules

module "gcs_buckets" {
  source  = "terraform-google-modules/cloud-storage/google"
  version = "11.0.0"

  project_id = var.project_id
  names      = [var.bucket_name]
  location   = var.location

  # Security settings
  force_destroy = {
    (var.bucket_name) = var.force_destroy
  }

  # Enable versioning
  versioning = {
    (var.bucket_name) = true
  }

  # Lifecycle rules
  lifecycle_rules = [
    {
      action = {
        type = "Delete"
      }
      condition = {
        age = 365 # Delete objects older than 1 year
      }
    }
  ]

  # Bucket-level IAM
  bucket_policy_only = {
    (var.bucket_name) = true
  }

  # CORS configuration
  cors = [
    {
      origin          = var.cors_origins
      method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
      response_header = ["*"]
      max_age_seconds = 3600
    }
  ]

  # Set admins, viewers, etc. (empty by default, managed via service account)
  set_admin_roles   = false
  set_creator_roles = false
  set_viewer_roles  = false

  admins   = []
  creators = []
  viewers  = []
}

# Create a service account for the application
resource "google_service_account" "storage_sa" {
  account_id   = "${var.bucket_name}-sa"
  display_name = "Service Account for ${var.bucket_name} bucket"
  project      = var.project_id
}

# Grant the service account access to the bucket
resource "google_storage_bucket_iam_member" "storage_sa_member" {
  bucket = module.gcs_buckets.names[0]
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${google_service_account.storage_sa.email}"
}

# Create a key for the service account
resource "google_service_account_key" "storage_sa_key" {
  service_account_id = google_service_account.storage_sa.name
  public_key_type    = "TYPE_X509_PEM_FILE"
}

# Store the service account key in Secret Manager
resource "google_secret_manager_secret" "storage_sa_key" {
  secret_id = "${var.bucket_name}-sa-key"
  project   = var.project_id

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "storage_sa_key" {
  secret      = google_secret_manager_secret.storage_sa_key.id
  secret_data = base64decode(google_service_account_key.storage_sa_key.private_key)
}
