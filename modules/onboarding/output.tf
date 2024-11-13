output "accounts_arn" {
  value       = module.accounts.arn
  description = "Map of ARNs `{ account_name: ARN }`"
}

output "accounts_id" {
  value       = module.accounts.id
  description = "Map of account IDs `{ account_name: account_id }`"
}

output "accounts_status" {
  value       = module.accounts.status
  description = "Map of account statuses `{ account_name: account_status }`"
}
