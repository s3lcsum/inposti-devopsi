## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.11.4 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 6.19.0, < 7.0.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 6.19.0, < 7.0.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_firewall_engineering_to_runtime"></a> [firewall\_engineering\_to\_runtime](#module\_firewall\_engineering\_to\_runtime) | terraform-google-modules/network/google//modules/firewall-rules | ~> 11.1 |
| <a name="module_firewall_runtime_to_engineering"></a> [firewall\_runtime\_to\_engineering](#module\_firewall\_runtime\_to\_engineering) | terraform-google-modules/network/google//modules/firewall-rules | ~> 11.1 |
| <a name="module_peering_engineering_to_runtime"></a> [peering\_engineering\_to\_runtime](#module\_peering\_engineering\_to\_runtime) | terraform-google-modules/network/google//modules/network-peering | ~> 11.1 |
| <a name="module_peering_runtime_to_engineering"></a> [peering\_runtime\_to\_engineering](#module\_peering\_runtime\_to\_engineering) | terraform-google-modules/network/google//modules/network-peering | ~> 11.1 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_engineering_subnet_cidr"></a> [engineering\_subnet\_cidr](#input\_engineering\_subnet\_cidr) | The CIDR block of the engineering subnet | `string` | n/a | yes |
| <a name="input_engineering_vpc_name"></a> [engineering\_vpc\_name](#input\_engineering\_vpc\_name) | The name of the engineering VPC (for firewall rules) | `string` | n/a | yes |
| <a name="input_engineering_vpc_self_link"></a> [engineering\_vpc\_self\_link](#input\_engineering\_vpc\_self\_link) | The self-link of the engineering VPC | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project to deploy to | `string` | n/a | yes |
| <a name="input_runtime_subnet_cidr"></a> [runtime\_subnet\_cidr](#input\_runtime\_subnet\_cidr) | The CIDR block of the runtime subnet | `string` | n/a | yes |
| <a name="input_runtime_vpc_name"></a> [runtime\_vpc\_name](#input\_runtime\_vpc\_name) | The name of the runtime VPC (for firewall rules) | `string` | n/a | yes |
| <a name="input_runtime_vpc_self_link"></a> [runtime\_vpc\_self\_link](#input\_runtime\_vpc\_self\_link) | The self-link of the runtime VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_engineering_to_runtime_peering_name"></a> [engineering\_to\_runtime\_peering\_name](#output\_engineering\_to\_runtime\_peering\_name) | The name of the engineering to runtime VPC peering |
| <a name="output_engineering_to_runtime_peering_state"></a> [engineering\_to\_runtime\_peering\_state](#output\_engineering\_to\_runtime\_peering\_state) | The state of the engineering to runtime VPC peering |
| <a name="output_local_network_peering"></a> [local\_network\_peering](#output\_local\_network\_peering) | Network peering resource. |
| <a name="output_peer_network_peering"></a> [peer\_network\_peering](#output\_peer\_network\_peering) | Peer network peering resource. |
| <a name="output_runtime_to_engineering_peering_name"></a> [runtime\_to\_engineering\_peering\_name](#output\_runtime\_to\_engineering\_peering\_name) | The name of the runtime to engineering VPC peering |
| <a name="output_runtime_to_engineering_peering_state"></a> [runtime\_to\_engineering\_peering\_state](#output\_runtime\_to\_engineering\_peering\_state) | The state of the runtime to engineering VPC peering |
