terraform {
  required_version = ">= 1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
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