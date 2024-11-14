/**
 * # The `onboarding` module
 *
 * This is the main module, in charge of creating everything requested.
 * If the logic of the infrastructure needs to be extended or modified, this
 * is the right place to do it.
 * 
 * Account owner email can be either be passed as a parameter or let it auto-generated, based on the account name.
 * If a `domain_name` parameter within the `accounts` list of maps  is null, it will **NOT** create any DNS resource at all
 * for that account.
 *
 */

module "organization" {
  source              = "../organization"
  ou_name             = "my-ou"
  permission_set_name = "admin-pset"
  identity_group = {
    name        = "admin"
    description = "Administrators group"
  }
}

locals {
  accounts_with_parent = [
    for a in var.accounts : (a.parent_id == null ? merge(a, { parent_id = module.organization.ou_id }) : merge(a, { parent_id = a.parent_id }))
  ]
}

module "accounts" {
  source   = "../account"
  accounts = local.accounts_with_parent
}
