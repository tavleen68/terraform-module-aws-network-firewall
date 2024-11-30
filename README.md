## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.48.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_networkfirewall_firewall.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/networkfirewall_firewall) | resource |
| [aws_networkfirewall_logging_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/networkfirewall_logging_configuration) | resource |
| [aws_ssm_parameter.network_firewall_subnet_ids](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.vpc_id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Tags used with all the resources provisioned by this script. | `map(string)` | `{}` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name used in the naming convention. | `string` | `""` | no |
| <a name="input_network_firewall_ssm_id"></a> [network\_firewall\_ssm\_id](#input\_network\_firewall\_ssm\_id) | Parameter store name from where the subnet IDs will be referenced for provisioning the firewall. | `string` | `""` | no |
| <a name="input_org_name"></a> [org\_name](#input\_org\_name) | Organization name used for the resource provisioning. | `string` | `""` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name used in the naming convention. | `string` | `""` | no |
| <a name="input_region_name"></a> [region\_name](#input\_region\_name) | AWS region used in the naming convention. | `string` | `""` | no |
| <a name="input_vpc_ssm_id"></a> [vpc\_ssm\_id](#input\_vpc\_ssm\_id) | Parameter store name from where the VPC ID will be referenced. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_network_firewall_cloudwatch_log_group"></a> [aws\_network\_firewall\_cloudwatch\_log\_group](#output\_aws\_network\_firewall\_cloudwatch\_log\_group) | n/a |
| <a name="output_aws_network_firewall_id"></a> [aws\_network\_firewall\_id](#output\_aws\_network\_firewall\_id) | n/a |
