output "ecs_cluster_id" {
  description = "ECS cluster ID"
  value       = aws_ecs_cluster.ecs_cluster.id
}

output "ecs_service_name" {
  description = "ECS service name"
  value       = aws_ecs_service.ecs_service.name
}

output "ecs_task_definition_arn" {
  description = "Task definition ARN"
  value       = aws_ecs_task_definition.ecs_task.arn
}
