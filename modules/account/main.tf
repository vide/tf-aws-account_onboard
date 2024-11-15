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
  email = {
    for a in var.accounts : a.name => (a.email == null ? "acct_${lower(a.name)}@vide.fastmail.com" : a.email)
  }

}

resource "aws_organizations_account" "this" {
  for_each  = { for a in var.accounts : a.name => a }
  name      = each.value.name
  email     = local.email[each.key]
  parent_id = each.value.parent_id
  # In case there is some manual role_name import, bear this in mind: 
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_account#role_name-1 
  role_name         = each.value.role
  close_on_deletion = each.value.close_on_deletion
}
