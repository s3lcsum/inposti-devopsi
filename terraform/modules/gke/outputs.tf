output "cluster_name" {
  description = "The name of the GKE cluster"
  value       = google_container_cluster.primary.name
}

output "cluster_id" {
  description = "The ID of the GKE cluster"
  value       = google_container_cluster.primary.id
}

output "cluster_endpoint" {
  description = "The IP address of the cluster master"
  value       = google_container_cluster.primary.endpoint
}

output "cluster_ca_certificate" {
  description = "The cluster CA certificate (base64 encoded)"
  value       = google_container_cluster.primary.master_auth[0].cluster_ca_certificate
  sensitive   = true
}

output "cluster_location" {
  description = "The location of the GKE cluster"
  value       = google_container_cluster.primary.location
}

output "cluster_network" {
  description = "The network of the GKE cluster"
  value       = google_container_cluster.primary.network
}

output "cluster_subnetwork" {
  description = "The subnetwork of the GKE cluster"
  value       = google_container_cluster.primary.subnetwork
}

output "node_pool_name" {
  description = "The name of the node pool"
  value       = google_container_node_pool.primary_nodes.name
}

output "node_pool_id" {
  description = "The ID of the node pool"
  value       = google_container_node_pool.primary_nodes.id
}

output "service_account_email" {
  description = "The email of the GKE service account"
  value       = google_service_account.gke_sa.email
}

output "workload_identity_pool" {
  description = "The workload identity pool"
  value       = google_container_cluster.primary.workload_identity_config[0].workload_pool
} 