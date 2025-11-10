output "certificate_arn" {
  value = aws_acm_certificate.certificate.arn
}
output "cert_validation" {
  value = aws_acm_certificate_validation.cert_validate
}
