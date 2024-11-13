module "account_onboarding" {
  source = "./modules/onboarding"
  accounts = [{
    name = "FooBar"
    # if we get to review this together, I'll explain why this is here :) 
    email       = "foo2@vide.fastmail.com"
    domain_name = null
    dns_records = [{
      name    = "foo"
      records = ["1.1.1.1"]
      ttl     = 3600
      type    = "A"
    }]
  }]
}
