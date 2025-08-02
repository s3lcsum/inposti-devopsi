# Production Environment Variables for Runtime Infrastructure

# GKE Configuration
gke_cluster_name = "web-app-prod-cluster"
gke_cluster_ipv4_cidr_block = "10.1.2.0/16"
gke_services_ipv4_cidr_block = "10.2.2.0/16"
gke_master_ipv4_cidr_block = "172.16.2.0/28"
gke_release_channel = "STABLE"
gke_machine_type = "e2-medium"
gke_disk_size_gb = 50
gke_initial_node_count = 2
gke_min_node_count = 2
gke_max_node_count = 5

# CloudSQL Configuration
cloudsql_instance_name = "web-app-prod-cloudsql"
cloudsql_name = "webapp_prod"
cloudsql_user = "webapp_prod_user"
cloudsql_disk_size = 20
cloudsql_deletion_protection = true 