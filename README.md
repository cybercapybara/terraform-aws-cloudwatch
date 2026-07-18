# terraform-aws-cloudwatch

Terraform module that manages an [Amazon
CloudWatch](https://aws.amazon.com/cloudwatch/) metric alarm, with an optional
companion log group. It creates a single alarm from the supplied metric and
threshold and can notify SNS topics or other actions on state change.

## Usage

```hcl
module "cloudwatch" {
  source = "github.com/cybercapybara/terraform-aws-cloudwatch"

  alarm_name          = "cpu-high"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  threshold           = 80
  comparison_operator = "GreaterThanThreshold"

  dimensions = {
    InstanceId = "i-0abc123"
  }

  tags = {
    Environment = "production"
    ManagedBy   = "terraform"
  }
}
```

A runnable example lives in [`examples/basic`](examples/basic).

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.5   |
| aws       | >= 5.0   |

## Inputs

| Name                  | Description                                             | Type          | Default                   | Required |
|-----------------------|---------------------------------------------------------|---------------|---------------------------|:--------:|
| `alarm_name`          | Name of the CloudWatch metric alarm.                    | `string`      | n/a                       |   yes    |
| `comparison_operator` | Operator used to compare against the threshold.         | `string`      | `"GreaterThanThreshold"`  |    no    |
| `evaluation_periods`  | Number of periods compared to the threshold.            | `number`      | `1`                       |    no    |
| `metric_name`         | Name of the metric associated with the alarm.           | `string`      | n/a                       |   yes    |
| `namespace`           | Namespace of the metric.                                | `string`      | n/a                       |   yes    |
| `period`              | Period in seconds over which the statistic is applied.  | `number`      | `300`                     |    no    |
| `statistic`           | Statistic to apply to the metric.                       | `string`      | `"Average"`               |    no    |
| `threshold`           | Value against which the statistic is compared.          | `number`      | n/a                       |   yes    |
| `dimensions`          | Map of dimensions to scope the metric to.               | `map(string)` | `{}`                      |    no    |
| `alarm_actions`       | ARNs to notify when the alarm fires.                    | `list(string)`| `[]`                      |    no    |
| `treat_missing_data`  | How the alarm treats missing data points.               | `string`      | `"missing"`               |    no    |
| `create_log_group`    | Create a companion CloudWatch log group.                | `bool`        | `false`                   |    no    |
| `log_group_name`      | Name of the log group to create.                        | `string`      | `null`                    |    no    |
| `log_retention_days`  | Days to retain log events.                              | `number`      | `14`                      |    no    |
| `tags`                | Tags applied to the alarm and log group.                | `map(string)` | `{}`                      |    no    |

## Outputs

| Name            | Description                                        |
|-----------------|----------------------------------------------------|
| `id`            | ID of the metric alarm.                            |
| `arn`           | ARN of the metric alarm.                           |
| `alarm_name`    | Name of the metric alarm.                          |
| `log_group_arn` | ARN of the companion log group, if created.        |

## License

[MIT](LICENSE)
