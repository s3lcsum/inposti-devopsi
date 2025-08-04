terraform {
  required_version = "1.11.4"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.46.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "6.46.0"
    }
  }

  # Backend configuration should be provided during terraform init
  # Example: terraform init -backend-config="bucket=your-terraform-state-bucket"
  backend "gcs" {
    prefix = "runtime/database/state"
  }
}

# Configure the Google Cloud provider
provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}
