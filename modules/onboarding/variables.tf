variable "account_name" {
  type    = string
  default = ""
}

variable "domain_name" {
  type    = string
  default = ""
}

variable "dns_records" {
  type    = list(string) # TODO: use proper object
  default = []
}


variable "accounts" {
  description = "List of the accounts to be created. Mandatory values: `name`, `email` and `parent_id`"
  type = list(object({
    name              = string
    email             = string
    parent_id         = string
    close_on_deletion = optional(bool, false)
    role              = optional(string, "RootAccountAccessRole")
    enable_dns        = optional(bool, false)
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