variable "project" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, prod)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the ALB will be deployed"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet IDs from VPC module"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "Security Group ID for the ALB"
  type        = string
}

variable "health_check_path" {
  description = "Path to use for health check (e.g., /health)"
  type        = string
  default     = "/"
}

variable "target_port" {
  description = "Port on which target containers are listening (e.g., 80)"
  type        = number
  default     = 80
}

variable "certificate_arn" {
  description = "ARN of the ACM certificate for HTTPS listener"
  type        = string
  default     = null
}

variable "enable_https" {
  description = "Whether to enable HTTPS listener"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to ALB resources"
}