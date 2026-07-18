variable "alarm_name" {
  description = "Name of the CloudWatch metric alarm."
  type        = string
}

variable "comparison_operator" {
  description = "Operator used to compare the statistic against the threshold."
  type        = string
  default     = "GreaterThanThreshold"
}

variable "evaluation_periods" {
  description = "Number of periods over which data is compared to the threshold."
  type        = number
  default     = 1
}

variable "metric_name" {
  description = "Name of the metric associated with the alarm."
  type        = string
}

variable "namespace" {
  description = "Namespace of the metric associated with the alarm."
  type        = string
}

variable "period" {
  description = "Period in seconds over which the statistic is applied."
  type        = number
  default     = 300
}

variable "statistic" {
  description = "Statistic to apply to the metric, for example Average or Sum."
  type        = string
  default     = "Average"
}

variable "threshold" {
  description = "Value against which the statistic is compared."
  type        = number
}

variable "dimensions" {
  description = "Map of dimensions to scope the metric to."
  type        = map(string)
  default     = {}
}

variable "alarm_actions" {
  description = "List of ARNs to notify when the alarm transitions into ALARM state."
  type        = list(string)
  default     = []
}

variable "treat_missing_data" {
  description = "How the alarm treats missing data points."
  type        = string
  default     = "missing"
}

variable "create_log_group" {
  description = "Whether to create a companion CloudWatch log group."
  type        = bool
  default     = false
}

variable "log_group_name" {
  description = "Name of the log group to create when create_log_group is true."
  type        = string
  default     = null
}

variable "log_retention_days" {
  description = "Number of days to retain log events in the log group."
  type        = number
  default     = 14
}

variable "tags" {
  description = "Tags applied to the alarm and log group."
  type        = map(string)
  default     = {}
}
