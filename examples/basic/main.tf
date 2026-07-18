terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

variable "region" {
  description = "AWS region for the provider."
  type        = string
  default     = "us-east-1"
}

variable "instance_id" {
  description = "EC2 instance ID to scope the alarm to."
  type        = string
}

provider "aws" {
  region = var.region
}

module "cloudwatch" {
  source = "../.."

  alarm_name          = "example-cpu-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 80

  dimensions = {
    InstanceId = var.instance_id
  }

  tags = {
    Environment = "sandbox"
    ManagedBy   = "terraform"
  }
}

output "alarm_arn" {
  value = module.cloudwatch.arn
}
