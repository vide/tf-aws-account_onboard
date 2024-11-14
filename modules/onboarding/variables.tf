variable "accounts" {
  description = "List of the accounts to be created. Mandatory values: `name`, for the account name"
  type = list(object({
    name              = string
    email             = optional(string, null)
    parent_id         = optional(string, null)
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

variable "org" {
  description = "Control details of the root Organization"
  type = object({
    org_units = list(object({
      name = string
    }))
  })
  default = null
}
