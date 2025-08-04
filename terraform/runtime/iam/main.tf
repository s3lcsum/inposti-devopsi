# IAM Infrastructure for Runtime Environment
# This creates service accounts and IAM roles for the web application

# Create service account for web application
resource "google_service_account" "web_app_sa" {
  account_id   = "web-app-${var.environment}"
  display_name = "Service Account for Web Application (${var.environment})"
  project      = var.project_id
}

# Create service account for CloudSQL Proxy
resource "google_service_account" "cloudsql_proxy_sa" {
  account_id   = "cloudsql-proxy-${var.environment}"
  display_name = "Service Account for CloudSQL Proxy (${var.environment})"
  project      = var.project_id
}

# Grant CloudSQL Client role to CloudSQL Proxy service account
resource "google_project_iam_member" "cloudsql_proxy_client" {
  project = var.project_id
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:${google_service_account.cloudsql_proxy_sa.email}"
}

# Grant Storage Object Viewer role to web app service account
resource "google_project_iam_member" "web_app_storage_viewer" {
  project = var.project_id
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.web_app_sa.email}"
}

# Grant Storage Object Creator role to web app service account (for uploads)
resource "google_project_iam_member" "web_app_storage_creator" {
  project = var.project_id
  role    = "roles/storage.objectCreator"
  member  = "serviceAccount:${google_service_account.web_app_sa.email}"
}

# Grant access to specific GCS bucket
resource "google_storage_bucket_iam_member" "web_app_bucket_access" {
  bucket = var.gcs_bucket_name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.web_app_sa.email}"
}

# Grant Secret Manager accessor role for application secrets
resource "google_project_iam_member" "web_app_secret_accessor" {
  project = var.project_id
  role    = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:${google_service_account.web_app_sa.email}"
}

# Create Workload Identity binding for Kubernetes service account
resource "google_service_account_iam_member" "web_app_workload_identity" {
  service_account_id = google_service_account.web_app_sa.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.project_id}.svc.id.goog[default/web-app-sa]"
}

resource "google_service_account_iam_member" "cloudsql_proxy_workload_identity" {
  service_account_id = google_service_account.cloudsql_proxy_sa.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.project_id}.svc.id.goog[default/cloudsql-proxy-sa]"
}

# Create custom IAM role for minimal permissions
resource "google_project_iam_custom_role" "web_app_custom" {
  role_id     = "webAppCustomRole${title(var.environment)}"
  title       = "Web App Custom Role (${var.environment})"
  description = "Custom role with minimal permissions for web application"
  project     = var.project_id

  permissions = [
    "storage.objects.get",
    "storage.objects.create",
    "storage.objects.delete",
    "secretmanager.versions.access",
    "monitoring.metricDescriptors.create",
    "monitoring.metricDescriptors.get",
    "monitoring.timeSeries.create",
    "logging.logEntries.create"
  ]
}

# Apply custom role to web app service account
resource "google_project_iam_member" "web_app_custom_role" {
  project = var.project_id
  role    = google_project_iam_custom_role.web_app_custom.name
  member  = "serviceAccount:${google_service_account.web_app_sa.email}"
}
