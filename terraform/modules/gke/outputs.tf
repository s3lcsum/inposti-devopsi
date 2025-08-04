# Outputs for the community GKE module

output "cluster_name" {
  description = "The name of the GKE cluster"
  value       = module.gke.name
}

output "cluster_id" {
  description = "The ID of the GKE cluster"
  value       = module.gke.cluster_id
}

output "cluster_endpoint" {
  description = "The IP address of the cluster master"
  value       = module.gke.endpoint
}

output "cluster_ca_certificate" {
  description = "The cluster CA certificate (base64 encoded)"
  value       = module.gke.ca_certificate
  sensitive   = true
}

output "cluster_location" {
  description = "The location of the GKE cluster"
  value       = module.gke.location
}

output "cluster_network" {
  description = "The network of the GKE cluster"
  value       = var.network
}

output "cluster_subnetwork" {
  description = "The subnetwork of the GKE cluster"
  value       = var.subnetwork
}

output "node_pool_name" {
  description = "The name of the node pool"
  value       = module.gke.node_pools_names[0]
}

output "node_pool_id" {
  description = "The ID of the node pool"
  value       = module.gke.node_pools_names[0]
}

output "service_account_email" {
  description = "The email of the GKE service account"
  value       = module.gke.service_account
}

output "workload_identity_pool" {
  description = "The workload identity pool"
  value       = "${var.project_id}.svc.id.goog"
}

# Additional community module outputs
# Note: kubeconfig_raw may not be available in private cluster module
# output "kubeconfig_raw" {
#   description = "A kubeconfig file configured to access the GKE cluster"
#   value       = module.gke.kubeconfig_raw
#   sensitive   = true
# }

output "master_version" {
  description = "The current version of the master in the cluster"
  value       = module.gke.master_version
}
