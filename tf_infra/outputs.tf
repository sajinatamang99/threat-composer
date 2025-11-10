output "repository_url" {
  value = module.ecr.repository_url
}

output "alb_arn" {
  value = module.alb.alb_arn
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "alb_target_group_arn" {
  value = module.alb.alb_target_group_arn
}

output "dns_record_fqdn" {
  value = module.dns.record_fqdn
}
