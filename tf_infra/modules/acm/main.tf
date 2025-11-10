# ACM Certificate for the domain
resource "aws_acm_certificate" "certificate" {
  domain_name       = "${var.record_name}.${var.domain_name}"
  validation_method = "DNS"

  subject_alternative_names = var.san_domains

  tags = merge(var.tags, {
    Name = "${var.project}-acm-cert"
  })
}

# Create DNS validation records in Route53 (for Route53)
resource "aws_route53_record" "validation" {
  for_each = {
    for dvo in aws_acm_certificate.certificate.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  zone_id = var.route53_zone_id
  name    = each.value.name
  type    = each.value.type
  ttl     = 60
  records = [each.value.record]
}

# Validate certificate
resource "aws_acm_certificate_validation" "cert_validate" {
  certificate_arn         = aws_acm_certificate.certificate.arn
  validation_record_fqdns = [for record in aws_route53_record.validation : record.fqdn]
}
