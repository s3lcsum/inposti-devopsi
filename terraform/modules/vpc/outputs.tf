output "vpc_id" {
  description = "The ID of the VPC"
  value       = google_compute_network.vpc.id
}

output "vpc_name" {
  description = "The name of the VPC"
  value       = google_compute_network.vpc.name
}

output "vpc_self_link" {
  description = "The self-link of the VPC"
  value       = google_compute_network.vpc.self_link
}

output "subnet_ids" {
  description = "The IDs of the subnets"
  value       = google_compute_subnetwork.subnet[*].id
}

output "subnet_names" {
  description = "The names of the subnets"
  value       = google_compute_subnetwork.subnet[*].name
}

output "subnet_self_links" {
  description = "The self-links of the subnets"
  value       = google_compute_subnetwork.subnet[*].self_link
} 