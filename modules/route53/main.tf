# route53.tf

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