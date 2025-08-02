# VPC Module for Google Cloud Platform
# This module creates a VPC with subnets for a web application

resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
  routing_mode           = "REGIONAL"
  project                = var.project_id
}

resource "google_compute_subnetwork" "subnet" {
  count         = length(var.subnets)
  name          = var.subnets[count.index].name
  ip_cidr_range = var.subnets[count.index].ip_cidr_range
  region        = var.subnets[count.index].region
  network       = google_compute_network.vpc.id
  project       = var.project_id

  # Enable flow logs for network monitoring
  log_config {
    aggregation_interval = "INTERVAL_5_SEC"
    flow_sampling       = 0.5
    metadata           = "INCLUDE_ALL_METADATA"
  }
}

# Firewall rule for internal communication
resource "google_compute_firewall" "internal" {
  name    = "${var.vpc_name}-internal"
  network = google_compute_network.vpc.name
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = [for subnet in var.subnets : subnet.ip_cidr_range]
  target_tags   = ["internal"]
}

# Firewall rule for web traffic
resource "google_compute_firewall" "web" {
  name    = "${var.vpc_name}-web"
  network = google_compute_network.vpc.name
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web"]
}

 