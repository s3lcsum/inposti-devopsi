terraform {
  required_version = "1.11.4"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.46.0"
    }
  }

  # Note: This backend configuration will be set after the bucket is created
  # backend "gcs" {
  #   bucket = "terraform-state-bucket-name"
  #   prefix = "engineering/terraform/state"
  # }
}

# Configure the Google Cloud provider
provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}
