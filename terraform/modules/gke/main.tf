# GKE Module using Community Module
# This module creates a GKE cluster using the official terraform-google-modules

module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  version = "37.1.0"

  project_id        = var.project_id
  name              = var.cluster_name
  region            = var.region
  zones             = length(var.zones) > 0 ? var.zones : null
  network           = var.network
  subnetwork        = var.subnetwork
  ip_range_pods     = var.cluster_ipv4_cidr_block
  ip_range_services = var.services_ipv4_cidr_block

  # Release channel for automatic updates
  release_channel = var.release_channel

  # Private cluster configuration
  enable_private_nodes    = true
  enable_private_endpoint = false
  master_ipv4_cidr_block  = var.master_ipv4_cidr_block

  # Master authorized networks
  master_authorized_networks = [
    {
      cidr_block   = "0.0.0.0/0"
      display_name = "All"
    }
  ]

  # Network policy
  network_policy             = true
  network_policy_provider    = "CALICO"
  horizontal_pod_autoscaling = true
  http_load_balancing        = true

  # Remove default node pool
  remove_default_node_pool = true

  # Node pools configuration
  node_pools = [
    {
      name               = "${var.cluster_name}-node-pool"
      machine_type       = var.machine_type
      min_count          = var.min_node_count
      max_count          = var.max_node_count
      local_ssd_count    = 0
      spot               = false
      disk_size_gb       = var.disk_size_gb
      disk_type          = "pd-ssd"
      image_type         = "COS_CONTAINERD"
      enable_gcfs        = false
      enable_gvnic       = false
      logging_variant    = "DEFAULT"
      auto_repair        = true
      auto_upgrade       = true
      service_account    = var.service_account
      preemptible        = false
      initial_node_count = var.initial_node_count
    }
  ]

  node_pools_oauth_scopes = {
    all = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  node_pools_labels = {
    all                             = {}
    "${var.cluster_name}-node-pool" = var.node_labels
  }

  node_pools_metadata = {
    all = {}
    "${var.cluster_name}-node-pool" = {
      node-pool-metadata-custom-value = "my-node-pool"
    }
  }

  node_pools_taints = {
    all                             = []
    "${var.cluster_name}-node-pool" = var.node_taints
  }

  node_pools_tags = {
    all                             = []
    "${var.cluster_name}-node-pool" = var.node_tags
  }

  # Maintenance window
  maintenance_start_time = "2023-01-01T02:00:00Z"
  maintenance_end_time   = "2023-01-01T06:00:00Z"
  maintenance_recurrence = "FREQ=WEEKLY;BYDAY=SU"

  # Cluster autoscaling
  cluster_autoscaling = {
    enabled             = true
    autoscaling_profile = "OPTIMIZE_UTILIZATION"
    min_cpu_cores       = 1
    max_cpu_cores       = 8
    min_memory_gb       = 2
    max_memory_gb       = 32
    gpu_resources       = []
    auto_repair         = true
    auto_upgrade        = true
  }

  # Create service account
  create_service_account = true
}

# Enable Workload Identity for the GKE cluster
resource "google_project_iam_member" "gke_workload_identity_user" {
  project = var.project_id
  role    = "roles/iam.workloadIdentityUser"
  member  = "serviceAccount:${var.project_id}.svc.id.goog[default/default]"
}
