module "account_onboarding" {
  source = "./modules/onboarding"
  accounts = [
    {
      name        = "account1"
      domain_name = "account1.wtf"
      dns_records = [{
        name    = "foo"
        records = ["1.1.1.1"]
        ttl     = 3600
        type    = "A"
      }]
    }
  ]
}
