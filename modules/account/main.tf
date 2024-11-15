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

resource "local_file" "providers" {
  filename = "${path.module}/children_accounts_providers.tf"

  content = join("\n", [
    for account_key, account in aws_organizations_account.this :
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
  depends_on = [aws_organizations_account.this]
}

resource "local_file" "route53" {
  filename = "${path.module}/children_accounts_route53.tf"

  content = join("\n", [
    for account in var.accounts :
    <<EOT
module "route53_${lower(account.name)}" {
  source      = "../route53"
  domain      = "${account.domain_name}"
  dns_records = ${jsonencode(account.dns_records)}
  providers = {
    aws = aws.${account.name}
  }
  depends_on = [local_file.route53]
}
EOT
  ])
  depends_on = [aws_organizations_account.this]
}
