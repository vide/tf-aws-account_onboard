# The Zone ID seems a useful value to return outside the module
output "zone_id" {
  value       = aws_route53_zone.this.zone_id
  description = "Zone ID of the hosted zone created"
}
