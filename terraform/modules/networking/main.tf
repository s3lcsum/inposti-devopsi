# Networking Module for VPC Peering using Community Modules
# This module creates VPC peering between engineering and runtime environments

# VPC Peering from engineering to runtime
module "peering_engineering_to_runtime" {
  source  = "terraform-google-modules/network/google//modules/network-peering"
  version = "~> 11.1"

  prefix        = "engineering-to-runtime"
  local_network = var.engineering_vpc_self_link
  peer_network  = var.runtime_vpc_self_link

  export_peer_custom_routes  = true
  export_local_custom_routes = true
}

# VPC Peering from runtime to engineering (bidirectional)
module "peering_runtime_to_engineering" {
  source  = "terraform-google-modules/network/google//modules/network-peering"
  version = "~> 11.1"

  prefix        = "runtime-to-engineering"
  local_network = var.runtime_vpc_self_link
  peer_network  = var.engineering_vpc_self_link

  export_peer_custom_routes  = true
  export_local_custom_routes = true

  depends_on = [module.peering_engineering_to_runtime]
}

# Firewall rules for engineering to runtime communication
module "firewall_engineering_to_runtime" {
  source  = "terraform-google-modules/network/google//modules/firewall-rules"
  version = "~> 11.1"

  project_id   = var.project_id
  network_name = var.runtime_vpc_name

  rules = [
    {
      name                    = "allow-engineering-to-runtime"
      description             = "Allow communication from engineering to runtime"
      direction               = "INGRESS"
      priority                = 1000
      ranges                  = [var.engineering_subnet_cidr]
      source_tags             = null
      source_service_accounts = null
      target_tags             = ["runtime"]
      target_service_accounts = null
      allow = [
        {
          protocol = "tcp"
          ports    = ["443", "8080", "8443"]
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
    }
  ]
}

# Firewall rules for runtime to engineering communication
module "firewall_runtime_to_engineering" {
  source  = "terraform-google-modules/network/google//modules/firewall-rules"
  version = "~> 11.1"

  project_id   = var.project_id
  network_name = var.engineering_vpc_name

  rules = [
    {
      name                    = "allow-runtime-to-engineering"
      description             = "Allow communication from runtime to engineering"
      direction               = "INGRESS"
      priority                = 1000
      ranges                  = [var.runtime_subnet_cidr]
      source_tags             = null
      source_service_accounts = null
      target_tags             = ["engineering"]
      target_service_accounts = null
      allow = [
        {
          protocol = "tcp"
          ports    = ["443", "8080", "8443"]
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
    }
  ]
}
