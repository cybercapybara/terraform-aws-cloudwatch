output "id" {
  description = "ID of the metric alarm."
  value       = aws_cloudwatch_metric_alarm.this.id
}

output "arn" {
  description = "ARN of the metric alarm."
  value       = aws_cloudwatch_metric_alarm.this.arn
}

output "alarm_name" {
  description = "Name of the metric alarm."
  value       = aws_cloudwatch_metric_alarm.this.alarm_name
}

output "log_group_arn" {
  description = "ARN of the companion log group, if one was created."
  value       = try(aws_cloudwatch_log_group.this[0].arn, null)
}
