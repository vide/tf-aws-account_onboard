output "arn" {
  value = { for a in aws_organizations_account.this : a.name => a.arn }
}

output "id" {
  value = { for a in aws_organizations_account.this : a.name => a.id }
}

output "status" {
  value = { for a in aws_organizations_account.this : a.name => a.status }
}
