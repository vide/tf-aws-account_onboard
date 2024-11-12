module "route53" {
  for_each = {
    for a in var.accounts : a.name => a
    if a.domain_name != null || a.domain_name != ""
  }
  source      = "../route53"
  domain      = each.value.domain_name
  dns_records = each.value.dns_records
}

resource "aws_organizations_account" "this" {
  for_each = { for a in var.accounts : a.name => a }
  name     = each.value.name
  #email             = "acct_${each.value.name}@vide.fastmail.com" # this is here as a reminder of my naivety
  email             = each.value.email
  parent_id         = each.value.parent_id
  role_name         = each.value.role
  close_on_deletion = each.value.close_on_deletion
  # this is to avoid drift, due to Org API limitations
  # more info: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_account#role_name-1 
  lifecycle {
    ignore_changes = [role_name]
  }
}
