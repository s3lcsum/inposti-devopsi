# Variables for the community VPC module

variable "project_id" {
  description = "The ID of the project to deploy to"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "web-app-vpc"
}

variable "subnets" {
  description = "List of subnets to create"
  type = list(object({
    name          = string
    ip_cidr_range = string
    region        = string
  }))
  default = [
    {
      name          = "web-subnet-1"
      ip_cidr_range = "10.0.1.0/24"
      region        = "us-central1"
    },
    {
      name          = "web-subnet-2"
      ip_cidr_range = "10.0.2.0/24"
      region        = "us-central1"
    }
  ]
}
