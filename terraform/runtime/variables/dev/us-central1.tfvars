# Development Environment Variables for Runtime Infrastructure

# GKE Configuration
gke_cluster_name = "web-app-dev-cluster"
gke_cluster_ipv4_cidr_block = "10.1.1.0/16"
gke_services_ipv4_cidr_block = "10.2.1.0/16"
gke_master_ipv4_cidr_block = "172.16.1.0/28"
gke_machine_type = "e2-small"
gke_disk_size_gb = 30
gke_initial_node_count = 1
gke_min_node_count = 1
gke_max_node_count = 3

# CloudSQL Configuration
cloudsql_instance_name = "web-app-dev-cloudsql"
cloudsql_name = "webapp_dev"
cloudsql_user = "webapp_dev_user"
cloudsql_disk_size = 10
cloudsql_deletion_protection = false 