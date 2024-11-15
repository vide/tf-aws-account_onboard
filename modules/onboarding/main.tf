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

# I assumed that "end-users" don't have a choice in which OU they are landing
# so I just inject the same OU in every account. If we want users to easily customize 
# this, I would take another approach for sure.
locals {
  accounts_with_parent = [
    for a in var.accounts : merge(a, { parent_id = module.organization.ou_id })
  ]
}

module "accounts" {
  count   = count(local.accounts_with_parent)
  source  = "../account"
  account = local.accounts_with_parent[count.index]
  domain  = a

}


resource "local_file" "providers" {
  filename = "${path.module}/children_accounts_providers.tf"

  content = join("\n", [
    for account_key, account in module.accounts :
    <<EOT
provider "aws" {
  alias  = "${account_key}"
  region = "eu-west-1"
  assume_role {
    role_arn = "arn:aws:iam::${account.id}:role/${account.role_name}"
  }
}
EOT
  ])
}
