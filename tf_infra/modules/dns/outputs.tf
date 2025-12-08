output "zone_id" {
  description = "The hosted zone ID looked up by data source"
  value       = data.aws_route53_zone.hosted_zone.zone_id
}

output "record_fqdn" {
  description = "The fully qualified domain name (FQDN) of the created record"
  value       = aws_route53_record.site_domain.fqdn
}
