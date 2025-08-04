# Variables for GCS Runtime Infrastructure

variable "project_id" {
  description = "The ID of the Google Cloud project"
  type        = string
}

variable "region" {
  description = "The region to deploy resources"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The zone to deploy resources"
  type        = string
  default     = "us-central1-a"
}

# GCS Variables
variable "gcs_bucket_name" {
  description = "The name of the GCS bucket for application storage"
  type        = string
  default     = "web-app-storage"
}

variable "gcs_location" {
  description = "The location of the GCS bucket"
  type        = string
  default     = "US"
}

variable "gcs_force_destroy" {
  description = "Whether to force destroy the bucket"
  type        = bool
  default     = false
}

variable "gcs_cors_origins" {
  description = "List of CORS origins for the bucket"
  type        = list(string)
  default     = ["https://*.example.com"]
}
