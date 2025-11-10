variable "domain_name" {
  description = "Primary domain name for certificate"
  type        = string
}

variable "record_name" {
  description = "The DNS record name to create within the hosted zone (e.g., www.example.com)"
  type        = string
}

variable "san_domains" {
  description = "Alternative domain names (SAN)"
  type        = list(string)
  default     = ["devopsproject.org"]
}

variable "route53_zone_id" {
  description = "Route53 Hosted Zone ID for DNS validation"
  type        = string
}

variable "project" {
  type        = string
  description = "Project name"
}

variable "tags" {
  type = map(string)
}
