variable "project_id" {
  description = "The ID of the project to deploy to"
  type        = string
}

variable "instance_name" {
  description = "The name of the database instance"
  type        = string
  default     = "web-app-db"
}

variable "database_name" {
  description = "The name of the database"
  type        = string
  default     = "webapp"
}

variable "db_user" {
  description = "The database user"
  type        = string
  default     = "webapp_user"
}

variable "db_password" {
  description = "The database password"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "The region to deploy the database"
  type        = string
  default     = "us-central1"
}

variable "machine_type" {
  description = "The machine type for the database instance"
  type        = string
  default     = "db-f1-micro"
}

variable "disk_size" {
  description = "The disk size in GB"
  type        = number
  default     = 10
}

variable "vpc_self_link" {
  description = "The self-link of the VPC"
  type        = string
}

variable "deletion_protection" {
  description = "Whether to enable deletion protection"
  type        = bool
  default     = true
} 