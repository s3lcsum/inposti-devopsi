# Variables for IAM Runtime Infrastructure

variable "project_id" {
  description = "The ID of the Google Cloud project"
  type        = string
}

variable "environment" {
  description = "The environment (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "gcs_bucket_name" {
  description = "The name of the GCS bucket for application storage"
  type        = string
}
