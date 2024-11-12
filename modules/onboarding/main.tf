module "organization" {
  source              = "../organization"
  ou_name             = "my-ou"
  permission_set_name = "admin-pset"
  identity_group = {
    name        = "admin"
    description = "Administrators group"
  }
}

module "accounts" {
  source = "../account"
  accounts = [{
    name      = "FooBar"
    email     = "foo@vide.fastmail.com"
    parent_id = module.organization.ou_id
  }]
}
