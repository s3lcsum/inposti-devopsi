# Storage Module for Google Cloud Storage
# This module creates a GCS bucket for web application storage

resource "google_storage_bucket" "bucket" {
  name          = var.bucket_name
  location      = var.location
  project       = var.project_id
  force_destroy = var.force_destroy

  # Enable versioning for data protection
  versioning {
    enabled = true
  }

  # Configure lifecycle rules
  lifecycle_rule {
    condition {
      age = 365  # Delete objects older than 1 year
    }
    action {
      type = "Delete"
    }
  }

  # Configure uniform bucket-level access
  uniform_bucket_level_access = true

  # Configure public access prevention
  public_access_prevention = "enforced"

  # Configure CORS for web access
  cors {
    origin          = var.cors_origins
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}

# Create a service account for the application
resource "google_service_account" "storage_sa" {
  account_id   = "${var.bucket_name}-sa"
  display_name = "Service Account for ${var.bucket_name} bucket"
  project      = var.project_id
}

# Grant the service account access to the bucket
resource "google_storage_bucket_iam_member" "storage_sa_member" {
  bucket = google_storage_bucket.bucket.name
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