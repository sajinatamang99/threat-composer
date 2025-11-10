output "alb_arn" {
  value = aws_lb.ALB.arn
}

output "alb_dns_name" {
  value = aws_lb.ALB.dns_name
}

output "alb_zone_id" {
  description = "Zone ID of the ALB (used for Route53 alias)"
  value       = aws_lb.ALB.zone_id
}

output "alb_target_group_arn" {
  value = aws_lb_target_group.tg.arn
}
output "alb_listener_arn" {
  value = aws_lb_listener.http.arn
}

output "alb_https_listener_arn" {
  value = try(aws_lb_listener.https[0].arn, null)
}
