module "route53_foobar3" {
  source      = "../route53"
  domain      = "foobar3.wtf"
  dns_records = [{"name":"foo","records":["1.1.1.1"],"ttl":3600,"type":"A"}]
  providers = {
    aws = aws.FooBar3
  }
  depends_on = [local_file.route53]
}

module "route53_foobar" {
  source      = "../route53"
  domain      = "foobar.wtf"
  dns_records = [{"name":"foo","records":["1.1.1.1"],"ttl":3600,"type":"A"}]
  providers = {
    aws = aws.FooBar
  }
  depends_on = [local_file.route53]
}
