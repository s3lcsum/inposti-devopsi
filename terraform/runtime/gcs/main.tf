# GCS Infrastructure for Runtime Environment
# This creates the GCS bucket for web application storage

# Create the GCS bucket for application storage
module "gcs" {
  source = "../../modules/gcs"

  project_id    = var.project_id
  bucket_name   = var.gcs_bucket_name
  location      = var.gcs_location
  force_destroy = var.gcs_force_destroy
  cors_origins  = var.gcs_cors_origins
}
