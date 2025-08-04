# Variables for CloudSQL Runtime Infrastructure

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

# CloudSQL Variables
variable "cloudsql_instance_name" {
  description = "The name of the CloudSQL instance"
  type        = string
  default     = "web-app-cloudsql"
}

variable "cloudsql_name" {
  description = "The name of the CloudSQL database"
  type        = string
  default     = "webapp"
}

variable "cloudsql_user" {
  description = "The CloudSQL user"
  type        = string
  default     = "webapp_user"
}

variable "cloudsql_password" {
  description = "The CloudSQL password"
  type        = string
  sensitive   = true
}

variable "cloudsql_machine_type" {
  description = "The machine type for the CloudSQL instance"
  type        = string
  default     = "db-f1-micro"
}

variable "cloudsql_disk_size" {
  description = "The disk size in GB for the CloudSQL instance"
  type        = number
  default     = 10
}

variable "cloudsql_deletion_protection" {
  description = "Whether to enable deletion protection for the CloudSQL instance"
  type        = bool
  default     = true
}
