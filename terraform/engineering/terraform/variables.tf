# Variables for Terraform State Management Infrastructure

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



variable "gcs_bucket_name" {
  description = "The name of the GCS bucket for Terraform state"
  type        = string
}

variable "storage_location" {
  description = "The location of the GCS bucket"
  type        = string
  default     = "US"
}
