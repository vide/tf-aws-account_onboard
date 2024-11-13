<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_accounts"></a> [accounts](#module\_accounts) | ../account | n/a |
| <a name="module_organization"></a> [organization](#module\_organization) | ../organization | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_accounts"></a> [accounts](#input\_accounts) | List of the accounts to be created. Mandatory values: `name`, `email` and `parent_id` | <pre>list(object({<br/>    name              = string<br/>    email             = string<br/>    close_on_deletion = optional(bool, false)<br/>    role              = optional(string, "RootAccountAccessRole")<br/>    domain_name       = optional(string, null)<br/>    dns_records = optional(list(object({<br/>      name    = string<br/>      type    = string<br/>      ttl     = number<br/>      records = list(string)<br/>    })), [])<br/>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_accounts_arn"></a> [accounts\_arn](#output\_accounts\_arn) | n/a |
| <a name="output_accounts_id"></a> [accounts\_id](#output\_accounts\_id) | n/a |
| <a name="output_accounts_status"></a> [accounts\_status](#output\_accounts\_status) | n/a |
<!-- END_TF_DOCS -->