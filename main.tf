resource "aws_cloudwatch_metric_alarm" "this" {
  alarm_name          = var.alarm_name
  comparison_operator = var.comparison_operator
  evaluation_periods  = var.evaluation_periods
  metric_name         = var.metric_name
  namespace           = var.namespace
  period              = var.period
  statistic           = var.statistic
  threshold           = var.threshold
  dimensions          = var.dimensions
  alarm_actions       = var.alarm_actions
  treat_missing_data  = var.treat_missing_data

  tags = var.tags
}

resource "aws_cloudwatch_log_group" "this" {
  count = var.create_log_group ? 1 : 0

  name              = var.log_group_name
  retention_in_days = var.log_retention_days

  tags = var.tags
}
