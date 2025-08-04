# Variables for the community Networking module

variable "project_id" {
  description = "The ID of the project to deploy to"
  type        = string
}

variable "engineering_vpc_self_link" {
  description = "The self-link of the engineering VPC"
  type        = string
}

variable "runtime_vpc_self_link" {
  description = "The self-link of the runtime VPC"
  type        = string
}

variable "engineering_vpc_name" {
  description = "The name of the engineering VPC (for firewall rules)"
  type        = string
}

variable "runtime_vpc_name" {
  description = "The name of the runtime VPC (for firewall rules)"
  type        = string
}

variable "engineering_subnet_cidr" {
  description = "The CIDR block of the engineering subnet"
  type        = string
}

variable "runtime_subnet_cidr" {
  description = "The CIDR block of the runtime subnet"
  type        = string
}
