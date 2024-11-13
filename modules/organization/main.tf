/**
 * # The `organization` module
 *
 * This module creates  the main Organization, and its OUs. Currently it just creates
 * one single, fixed OU. 
 *
 */

# AWS Org API works only in the "global" region
provider "aws" {
  region = "us-east-1"
  alias  = "global"
}

resource "aws_organizations_organization" "this" {
  feature_set = "ALL"
  aws_service_access_principals = [
    "sso.amazonaws.com",
  ]
  provider = aws.global
}

resource "aws_organizations_organizational_unit" "my_ou" {
  name      = var.ou_name
  parent_id = aws_organizations_organization.this.roots[0].id
  provider  = aws.global
}
