variable "accounts" {
  description = "List of the accounts to be created. Mandatory values: `name`, `email` and `parent_id`"
  type = list(object({
    name              = string
    email             = string
    close_on_deletion = optional(bool, false)
    role              = optional(string, "RootAccountAccessRole")
    domain_name       = optional(string, null)
    dns_records = optional(list(object({
      name    = string
      type    = string
      ttl     = number
      records = list(string)
    })), [])
  }))
  default = []
}
