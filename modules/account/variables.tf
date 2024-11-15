variable "account" {
  description = "Account to be created. Mandatory values: `name`, `email`, `parent_id`"
  type = object({
    name              = string
    email             = string
    parent_id         = string
    close_on_deletion = optional(bool, false)
    role              = optional(string, "RootAccountAccessRole")
    domain_name       = optional(string, null)
    dns_records = optional(list(object({
      name    = string
      type    = string
      ttl     = number
      records = list(string)
    })), [])
  })
}
