variable "domain" {
  description = "The domain for the Route 53 zone."
  type        = string
}

variable "dns_records" {
  description = "List of DNS records to create within the zone."
  type = list(object({
    name    = string
    type    = string
    ttl     = number
    records = list(string)
  }))
  # TODO: add validation 
}
