module "organization" {
  source              = "../organization"
  ou_name             = "my-ou"
  permission_set_name = "admin-pset"
  identity_group = {
    name        = "admin"
    description = "Administrators group"
  }
}

# I assumed that "end-users" don't have a choice in which OU they are landing
# so I just inject the same OU in every account. If we want users to easily customize 
# this, I would take another approach for sure.
locals {
  accounts_with_parent = [
    for a in var.accounts : merge(a, { parent_id = module.organization.ou_id })
  ]
}

module "accounts" {
  source   = "../account"
  accounts = local.accounts_with_parent
}
