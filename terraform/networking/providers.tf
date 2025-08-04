terraform {
  required_version = ">= 1.11.4"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.51.0, < 6.0.0"
    }
  }

  # Backend configuration should be provided during terraform init
  # Example: terraform init -backend-config="bucket=your-terraform-state-bucket"
  backend "gcs" {
    prefix = "networking/state"
  }
}

# Configure the Google Cloud provider
provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}
