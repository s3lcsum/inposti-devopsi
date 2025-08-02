# Outputs for GKE Engineering Infrastructure

# Note: VPC outputs are now provided by terraform/networking/
# Use data sources or remote state to get VPC information if needed

output "argocd_cluster_name" {
  description = "The name of the ArgoCD management cluster"
  value       = module.argocd_cluster.cluster_name
}

output "argocd_cluster_endpoint" {
  description = "The endpoint of the ArgoCD management cluster"
  value       = module.argocd_cluster.cluster_endpoint
}

output "argocd_cluster_location" {
  description = "The location of the ArgoCD management cluster"
  value       = module.argocd_cluster.cluster_location
} 