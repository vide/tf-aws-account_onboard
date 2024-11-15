<!-- BEGIN_TF_DOCS -->
# The `account` module

This module creates the children accounts in the main Organization, under a fixed
`my-ou` Organizational Unit.

It also creates a DNS domain and a hosted zone **in the root account**, plus all the desired DNS records.
If the `domain_name` parameter is null, it will **NOT** create any DNS resource at all.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.75 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.75 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_route53"></a> [route53](#module\_route53) | ../route53 | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_organizations_account.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_accounts"></a> [accounts](#input\_accounts) | List of the accounts to be created. Mandatory values: `name`, `email`, `parent_id` | <pre>list(object({<br/>    name              = string<br/>    email             = string<br/>    parent_id         = string<br/>    close_on_deletion = optional(bool, false)<br/>    role              = optional(string, "RootAccountAccessRole")<br/>    domain_name       = optional(string, null)<br/>    dns_records = optional(list(object({<br/>      name    = string<br/>      type    = string<br/>      ttl     = number<br/>      records = list(string)<br/>    })), [])<br/>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | Map of ARNs `{ account_name: ARN }` |
| <a name="output_id"></a> [id](#output\_id) | Map of account IDs `{ account_name: account_id }` |
| <a name="output_status"></a> [status](#output\_status) | Map of account statuses `{ account_name: account_status }` |
<!-- END_TF_DOCS -->