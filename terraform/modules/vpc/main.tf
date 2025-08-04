# VPC Module using Community Module
# This module creates a VPC with subnets using the official terraform-google-modules

module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "11.1.1"

  project_id   = var.project_id
  network_name = var.vpc_name
  routing_mode = "REGIONAL"

  subnets = [
    for subnet in var.subnets : {
      subnet_name           = subnet.name
      subnet_ip             = subnet.ip_cidr_range
      subnet_region         = subnet.region
      subnet_private_access = "true"
      subnet_flow_logs      = "true"
      description           = "Subnet created by VPC module"
    }
  ]

  secondary_ranges = {}

  # Routes are handled separately in the community module
  routes = []

  # Firewall rules
  firewall_rules = [
    {
      name                    = "${var.vpc_name}-internal"
      description             = "Allow internal communication"
      direction               = "INGRESS"
      priority                = 1000
      ranges                  = [for subnet in var.subnets : subnet.ip_cidr_range]
      source_tags             = null
      source_service_accounts = null
      target_tags             = ["internal"]
      target_service_accounts = null
      allow = [
        {
          protocol = "tcp"
          ports    = ["0-65535"]
        },
        {
          protocol = "udp"
          ports    = ["0-65535"]
        },
        {
          protocol = "icmp"
          ports    = null
        }
      ]
      deny = []
      log_config = {
        metadata = "INCLUDE_ALL_METADATA"
      }
    },
    {
      name                    = "${var.vpc_name}-web"
      description             = "Allow web traffic"
      direction               = "INGRESS"
      priority                = 1000
      ranges                  = ["0.0.0.0/0"]
      source_tags             = null
      source_service_accounts = null
      target_tags             = ["web"]
      target_service_accounts = null
      allow = [
        {
          protocol = "tcp"
          ports    = ["80", "443"]
        }
      ]
      deny = []
      log_config = {
        metadata = "INCLUDE_ALL_METADATA"
      }
    }
  ]
}
