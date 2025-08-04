## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.11.4 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 5.5.0, < 7.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 6.46.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gcs_buckets"></a> [gcs\_buckets](#module\_gcs\_buckets) | terraform-google-modules/cloud-storage/google | ~> 11.0 |

## Resources

| Name | Type |
|------|------|
| [google_secret_manager_secret.storage_sa_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret) | resource |
| [google_secret_manager_secret_version.storage_sa_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret_version) | resource |
| [google_service_account.storage_sa](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_key.storage_sa_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_key) | resource |
| [google_storage_bucket_iam_member.storage_sa_member](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the GCS bucket | `string` | n/a | yes |
| <a name="input_cors_origins"></a> [cors\_origins](#input\_cors\_origins) | List of CORS origins | `list(string)` | <pre>[<br/>  "*"<br/>]</pre> | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | Whether to force destroy the bucket | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | The location of the GCS bucket | `string` | `"US"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project to deploy to | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket"></a> [bucket](#output\_bucket) | Bucket resource (for single use). |
| <a name="output_bucket_name"></a> [bucket\_name](#output\_bucket\_name) | The name of the GCS bucket |
| <a name="output_bucket_url"></a> [bucket\_url](#output\_bucket\_url) | The URL of the GCS bucket |
| <a name="output_buckets"></a> [buckets](#output\_buckets) | Bucket resources as list. |
| <a name="output_names"></a> [names](#output\_names) | Bucket names. |
| <a name="output_service_account_email"></a> [service\_account\_email](#output\_service\_account\_email) | The email of the service account |
| <a name="output_service_account_key_secret_id"></a> [service\_account\_key\_secret\_id](#output\_service\_account\_key\_secret\_id) | The ID of the secret containing the service account key |
| <a name="output_urls"></a> [urls](#output\_urls) | Bucket URLs. |
