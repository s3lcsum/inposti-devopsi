# GKE Infrastructure for Engineering Environment
# This creates the GKE cluster that hosts ArgoCD management



# Use existing networking infrastructure
# Note: VPC should be created by terraform/networking/ first
# This configuration assumes the networking infrastructure is already deployed

# Create GKE cluster for ArgoCD management
module "argocd_cluster" {
  source = "../../modules/gke"

  project_id                  = var.project_id
  cluster_name                = "argocd-management-cluster"
  location                    = var.region
  network                     = "engineering-vpc"
  subnetwork                  = "engineering-subnet"
  cluster_ipv4_cidr_block     = "10.1.10.0/16"
  services_ipv4_cidr_block    = "10.2.10.0/16"
  master_ipv4_cidr_block      = "172.16.10.0/28"
  release_channel             = "REGULAR"
  machine_type                = "e2-medium"
  disk_size_gb                = 50
  initial_node_count          = 2
  min_node_count              = 1
  max_node_count              = 3
  node_labels = {
    environment = "engineering"
    app         = "argocd"
  }
  node_tags = ["gke-node", "argocd"]
  node_taints = []
} 