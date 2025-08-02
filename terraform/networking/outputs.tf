# Outputs for Networking Infrastructure

# Engineering VPC outputs
output "engineering_vpc_id" {
  description = "The ID of the engineering VPC"
  value       = module.engineering_vpc.vpc_id
}

output "engineering_vpc_name" {
  description = "The name of the engineering VPC"
  value       = module.engineering_vpc.vpc_name
}

output "engineering_vpc_self_link" {
  description = "The self-link of the engineering VPC"
  value       = module.engineering_vpc.vpc_self_link
}

output "engineering_subnet_names" {
  description = "The names of the engineering subnets"
  value       = module.engineering_vpc.subnet_names
}

# Runtime VPC outputs
output "runtime_vpc_id" {
  description = "The ID of the runtime VPC"
  value       = module.runtime_vpc.vpc_id
}

output "runtime_vpc_name" {
  description = "The name of the runtime VPC"
  value       = module.runtime_vpc.vpc_name
}

output "runtime_vpc_self_link" {
  description = "The self-link of the runtime VPC"
  value       = module.runtime_vpc.vpc_self_link
}

output "runtime_subnet_names" {
  description = "The names of the runtime subnets"
  value       = module.runtime_vpc.subnet_names
}

# Networking module outputs
output "engineering_to_runtime_peering_name" {
  description = "The name of the engineering to runtime VPC peering"
  value       = module.networking.engineering_to_runtime_peering_name
}

output "runtime_to_engineering_peering_name" {
  description = "The name of the runtime to engineering VPC peering"
  value       = module.networking.runtime_to_engineering_peering_name
} 