/**
 * # The `route53` module
 *
 * This module creates all the DNS/Route53 related infra.
 * 
 * It creates a DNS domain and a hosted zone **in the root account**, plus all the desired DNS records.
 * If the `domain_name` parameter is null, it will **NOT** create any DNS resource at all.
 *
 */

resource "aws_route53_zone" "this" {
  name = var.domain
}

resource "aws_route53_record" "dns_records" {
  count = length(var.dns_records)

  zone_id = aws_route53_zone.this.id
  name    = var.dns_records[count.index].name
  type    = var.dns_records[count.index].type
  ttl     = var.dns_records[count.index].ttl
  records = var.dns_records[count.index].records
}
