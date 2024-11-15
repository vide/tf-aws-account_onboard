<!-- BEGIN_TF_DOCS -->
# The `route53` module

This module creates all the DNS/Route53 related infra.

It creates a DNS domain and a hosted zone **in the root account**, plus all the desired DNS records.
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

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.dns_records](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_records"></a> [dns\_records](#input\_dns\_records) | List of DNS records to create within the zone. | <pre>list(object({<br/>    name    = string<br/>    type    = string<br/>    ttl     = number<br/>    records = list(string)<br/>  }))</pre> | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | The domain for the Route 53 zone. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | Zone ID of the hosted zone created |
<!-- END_TF_DOCS -->