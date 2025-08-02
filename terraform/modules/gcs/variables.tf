variable "project_id" {
  description = "The ID of the project to deploy to"
  type        = string
}

variable "bucket_name" {
  description = "The name of the GCS bucket"
  type        = string
}

variable "location" {
  description = "The location of the GCS bucket"
  type        = string
  default     = "US"
}

variable "force_destroy" {
  description = "Whether to force destroy the bucket"
  type        = bool
  default     = false
}

variable "cors_origins" {
  description = "List of CORS origins"
  type        = list(string)
  default     = ["*"]
} 