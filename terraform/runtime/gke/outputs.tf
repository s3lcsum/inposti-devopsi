# Outputs for GKE Runtime Infrastructure

output "cluster_name" {
  description = "The name of the GKE cluster"
  value       = module.gke.cluster_name
}

output "cluster_endpoint" {
  description = "The endpoint of the GKE cluster"
  value       = module.gke.cluster_endpoint
}

output "cluster_location" {
  description = "The location of the GKE cluster"
  value       = module.gke.cluster_location
}

output "node_pool_name" {
  description = "The name of the node pool"
  value       = module.gke.node_pool_name
}

output "gke_service_account_email" {
  description = "The email of the GKE service account"
  value       = module.gke.service_account_email
}

output "workload_identity_pool" {
  description = "The workload identity pool"
  value       = module.gke.workload_identity_pool
} 