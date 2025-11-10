variable "domain_name" {
  description = "The domain name for which the hosted zone exists (e.g., example.com)"
  type        = string
}

variable "record_name" {
  description = "The DNS record name to create within the hosted zone (e.g., www.example.com)"
  type        = string
}

variable "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  type        = string
}

variable "alb_zone_id" {
  description = "Canonical hosted zone ID of the Application Load Balancer"
  type        = string
}

variable "tags" {
  description = "Tags to apply to DNS resources"
  type        = map(string)
}
