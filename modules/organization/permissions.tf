data "aws_ssoadmin_instances" "this" {}

resource "aws_identitystore_group" "this" {
  display_name      = var.identity_group["name"]
  description       = var.identity_group["description"]
  identity_store_id = data.aws_ssoadmin_instances.this.identity_store_ids[0]
}

resource "aws_ssoadmin_permission_set" "admin_permission_set" {
  instance_arn     = data.aws_ssoadmin_instances.this.arns[0]
  name             = var.permission_set_name
  description      = "Admin access for group"
  session_duration = "PT8H" # 8 hours
}

resource "aws_ssoadmin_managed_policy_attachment" "this" {
  instance_arn       = data.aws_ssoadmin_instances.this.arns[0]
  permission_set_arn = aws_ssoadmin_permission_set.admin_permission_set.arn
  managed_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
