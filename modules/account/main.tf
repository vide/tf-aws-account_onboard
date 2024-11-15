/**
 * # The `account` module
 *
 * This module creates the children accounts in the main Organization, under a fixed
 * `my-ou` Organizational Unit.
 * 
 * It also creates a DNS domain and a hosted zone **in the root account**, plus all the desired DNS records.
 * If the `domain_name` parameter is null, it will **NOT** create any DNS resource at all.
 *
 */

locals {
  # auto-generate an email for the account owner, if none was passed explicitly.
  # TODO: make the templated address easier to customize
  email = { for a in var.accounts : a.name => (a.email == null ? "acct_${lower(a.name)}@vide.fastmail.com" : a.email)
  }
}

module "route53" {
  for_each = {
    for a in var.accounts : a.name => a if a.domain_name != null
  }
  source      = "../route53"
  domain      = each.value.domain_name
  dns_records = each.value.dns_records
}

resource "aws_organizations_account" "this" {
  for_each          = { for a in var.accounts : a.name => a }
  name              = each.value.name
  email             = local.email[each.key]
  parent_id         = each.value.parent_id
  role_name         = each.value.role
  close_on_deletion = each.value.close_on_deletion
  # this is to avoid drift, due to Org API limitations
  # more info: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_account#role_name-1 
  lifecycle {
    ignore_changes = [role_name]
  }
}
