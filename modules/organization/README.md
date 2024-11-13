<!-- BEGIN_TF_DOCS -->
# The `organization` module

This module creates  the main Organization, and its OUs. Currently it just creates
one single, fixed OU.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.75 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.75 |
| <a name="provider_aws.global"></a> [aws.global](#provider\_aws.global) | ~> 5.75 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_identitystore_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/identitystore_group) | resource |
| [aws_organizations_organization.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organization) | resource |
| [aws_organizations_organizational_unit.my_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_ssoadmin_managed_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssoadmin_managed_policy_attachment) | resource |
| [aws_ssoadmin_permission_set.admin_permission_set](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssoadmin_permission_set) | resource |
| [aws_ssoadmin_instances.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssoadmin_instances) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_existing_org_id"></a> [existing\_org\_id](#input\_existing\_org\_id) | The ID of the existing Organization created via the web console during root account bootstrap. Will be used to import it in the state. | `string` | `null` | no |
| <a name="input_identity_group"></a> [identity\_group](#input\_identity\_group) | The main identity store group to use | <pre>object({<br/>    name        = string,<br/>    description = string<br/>  })</pre> | n/a | yes |
| <a name="input_ou_name"></a> [ou\_name](#input\_ou\_name) | The name of the Organizational Unit. | `string` | `"my-ou"` | no |
| <a name="input_permission_set_name"></a> [permission\_set\_name](#input\_permission\_set\_name) | The name of the permission set. | `string` | `"admin"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ou_id"></a> [ou\_id](#output\_ou\_id) | The ID of the OU created within the organization. |
<!-- END_TF_DOCS -->