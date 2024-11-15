<!-- BEGIN_TF_DOCS -->
# The `onboarding` module

This is the main module, in charge of creating everything requested.
If the logic of the infrastructure needs to be extended or modified, this
is the right place to do it.

Account owner email can be either be passed as a parameter or let it auto-generated, based on the account name.
If a `domain_name` parameter within the `accounts` list of maps  is null, it will **NOT** create any DNS resource at all
for that account.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.75 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_accounts"></a> [accounts](#module\_accounts) | ../account | n/a |
| <a name="module_organization"></a> [organization](#module\_organization) | ../organization | n/a |

## Resources

| Name | Type |
|------|------|
| [local_file.providers](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_accounts"></a> [accounts](#input\_accounts) | List of the accounts to be created. Mandatory values: `name`, for the account name | <pre>list(object({<br/>    name              = string<br/>    email             = optional(string, null)<br/>    close_on_deletion = optional(bool, false)<br/>    role              = optional(string, "RootAccountAccessRole")<br/>    domain_name       = optional(string, null)<br/>    dns_records = optional(list(object({<br/>      name    = string<br/>      type    = string<br/>      ttl     = number<br/>      records = list(string)<br/>    })), [])<br/>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_accounts_arn"></a> [accounts\_arn](#output\_accounts\_arn) | Map of ARNs `{ account_name: ARN }` |
| <a name="output_accounts_id"></a> [accounts\_id](#output\_accounts\_id) | Map of account IDs `{ account_name: account_id }` |
| <a name="output_accounts_status"></a> [accounts\_status](#output\_accounts\_status) | Map of account statuses `{ account_name: account_status }` |
<!-- END_TF_DOCS -->