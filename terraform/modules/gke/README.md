## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.11.4 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 5.40.0, < 7.0.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.10 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.45.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gke"></a> [gke](#module\_gke) | terraform-google-modules/kubernetes-engine/google//modules/private-cluster | ~> 32.0 |

## Resources

| Name | Type |
|------|------|
| [google_project_iam_member.gke_workload_identity_user](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_ipv4_cidr_block"></a> [cluster\_ipv4\_cidr\_block](#input\_cluster\_ipv4\_cidr\_block) | The IP address range for pods in the cluster | `string` | `"10.1.0.0/16"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the GKE cluster | `string` | `"web-app-cluster"` | no |
| <a name="input_disk_size_gb"></a> [disk\_size\_gb](#input\_disk\_size\_gb) | The disk size in GB for the GKE nodes | `number` | `50` | no |
| <a name="input_initial_node_count"></a> [initial\_node\_count](#input\_initial\_node\_count) | The initial number of nodes in the node pool | `number` | `2` | no |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | The machine type for the GKE nodes | `string` | `"e2-medium"` | no |
| <a name="input_master_ipv4_cidr_block"></a> [master\_ipv4\_cidr\_block](#input\_master\_ipv4\_cidr\_block) | The IP address range for the master network | `string` | `"172.16.0.0/28"` | no |
| <a name="input_max_node_count"></a> [max\_node\_count](#input\_max\_node\_count) | The maximum number of nodes in the node pool | `number` | `5` | no |
| <a name="input_min_node_count"></a> [min\_node\_count](#input\_min\_node\_count) | The minimum number of nodes in the node pool | `number` | `1` | no |
| <a name="input_network"></a> [network](#input\_network) | The VPC network to host the cluster | `string` | n/a | yes |
| <a name="input_node_labels"></a> [node\_labels](#input\_node\_labels) | Labels to apply to the nodes | `map(string)` | <pre>{<br/>  "app": "web-app",<br/>  "environment": "production"<br/>}</pre> | no |
| <a name="input_node_tags"></a> [node\_tags](#input\_node\_tags) | Tags to apply to the nodes | `list(string)` | <pre>[<br/>  "gke-node",<br/>  "web-app"<br/>]</pre> | no |
| <a name="input_node_taints"></a> [node\_taints](#input\_node\_taints) | Taints to apply to the nodes | <pre>list(object({<br/>    key    = string<br/>    value  = string<br/>    effect = string<br/>  }))</pre> | `[]` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project to deploy to | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region of the GKE cluster | `string` | `"us-central1"` | no |
| <a name="input_release_channel"></a> [release\_channel](#input\_release\_channel) | The release channel of the cluster | `string` | `"REGULAR"` | no |
| <a name="input_service_account"></a> [service\_account](#input\_service\_account) | The service account to be used by the Node VMs | `string` | `""` | no |
| <a name="input_services_ipv4_cidr_block"></a> [services\_ipv4\_cidr\_block](#input\_services\_ipv4\_cidr\_block) | The IP address range for services in the cluster | `string` | `"10.2.0.0/16"` | no |
| <a name="input_subnetwork"></a> [subnetwork](#input\_subnetwork) | The subnetwork to host the cluster | `string` | n/a | yes |
| <a name="input_zones"></a> [zones](#input\_zones) | The zones to host the cluster in | `list(string)` | <pre>[<br/>  "us-central1-a",<br/>  "us-central1-b",<br/>  "us-central1-f"<br/>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | The cluster CA certificate (base64 encoded) |
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint) | The IP address of the cluster master |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | The ID of the GKE cluster |
| <a name="output_cluster_location"></a> [cluster\_location](#output\_cluster\_location) | The location of the GKE cluster |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | The name of the GKE cluster |
| <a name="output_cluster_network"></a> [cluster\_network](#output\_cluster\_network) | The network of the GKE cluster |
| <a name="output_cluster_subnetwork"></a> [cluster\_subnetwork](#output\_cluster\_subnetwork) | The subnetwork of the GKE cluster |
| <a name="output_master_version"></a> [master\_version](#output\_master\_version) | The current version of the master in the cluster |
| <a name="output_node_pool_id"></a> [node\_pool\_id](#output\_node\_pool\_id) | The ID of the node pool |
| <a name="output_node_pool_name"></a> [node\_pool\_name](#output\_node\_pool\_name) | The name of the node pool |
| <a name="output_service_account_email"></a> [service\_account\_email](#output\_service\_account\_email) | The email of the GKE service account |
| <a name="output_workload_identity_pool"></a> [workload\_identity\_pool](#output\_workload\_identity\_pool) | The workload identity pool |
