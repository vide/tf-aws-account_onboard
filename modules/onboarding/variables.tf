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
