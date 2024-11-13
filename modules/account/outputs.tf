output "arn" {
  value       = { for a in aws_organizations_account.this : a.name => a.arn }
  description = "Map of ARNs `{ account_name: ARN }`"
}

output "id" {
  value       = { for a in aws_organizations_account.this : a.name => a.id }
  description = "Map of account IDs `{ account_name: account_id }`"
}

output "status" {
  value       = { for a in aws_organizations_account.this : a.name => a.status }
  description = "Map of account statuses `{ account_name: account_status }`"
}
