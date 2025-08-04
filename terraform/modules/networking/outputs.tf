# Outputs for the community Networking module

output "engineering_to_runtime_peering_name" {
  description = "The name of the engineering to runtime VPC peering"
  value       = "engineering-to-runtime"
}

output "runtime_to_engineering_peering_name" {
  description = "The name of the runtime to engineering VPC peering"
  value       = "runtime-to-engineering"
}

output "engineering_to_runtime_peering_state" {
  description = "The state of the engineering to runtime VPC peering"
  value       = module.peering_engineering_to_runtime.local_network_peering.state
}

output "runtime_to_engineering_peering_state" {
  description = "The state of the runtime to engineering VPC peering"
  value       = module.peering_runtime_to_engineering.local_network_peering.state
}

# Additional outputs from the community modules
output "local_network_peering" {
  description = "Network peering resource."
  value = {
    engineering_to_runtime = module.peering_engineering_to_runtime.local_network_peering
    runtime_to_engineering = module.peering_runtime_to_engineering.local_network_peering
  }
}

output "peer_network_peering" {
  description = "Peer network peering resource."
  value = {
    engineering_to_runtime = module.peering_engineering_to_runtime.peer_network_peering
    runtime_to_engineering = module.peering_runtime_to_engineering.peer_network_peering
  }
}
