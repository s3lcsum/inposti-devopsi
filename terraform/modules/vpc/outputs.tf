# Outputs for the community VPC module

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.network_id
}

output "vpc_name" {
  description = "The name of the VPC"
  value       = module.vpc.network_name
}

output "vpc_self_link" {
  description = "The self-link of the VPC"
  value       = module.vpc.network_self_link
}

output "subnet_ids" {
  description = "The IDs of the subnets"
  value       = module.vpc.subnets_ids
}

output "subnet_names" {
  description = "The names of the subnets"
  value       = module.vpc.subnets_names
}

output "subnet_self_links" {
  description = "The self-links of the subnets"
  value       = module.vpc.subnets_self_links
}

# Additional outputs from the community module
output "network" {
  description = "The created network"
  value       = module.vpc.network
}

output "subnets" {
  description = "A map with keys of form subnet_region/subnet_name and values being the outputs of the google_compute_subnetwork resources"
  value       = module.vpc.subnets
}

output "route_names" {
  description = "The route names associated with this VPC"
  value       = module.vpc.route_names
}
