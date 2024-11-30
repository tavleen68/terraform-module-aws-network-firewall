data "aws_ssm_parameter" "vpc_id" {
  name = var.vpc_ssm_id
}
data "aws_ssm_parameter" "network_firewall_subnet_ids" {
  name = var.network_firewall_ssm_id
}
locals {
  vpc_id                      = nonsensitive(data.aws_ssm_parameter.vpc_id.value)
  network_firewall_subnet_ids = nonsensitive(split(",", data.aws_ssm_parameter.network_firewall_subnet_ids.value))
}

#######################################################################################################
# Network Firewall
#######################################################################################################

resource "aws_networkfirewall_firewall" "this" {
  name                = "${var.org_name}-${var.region_name}-${var.environment}-${var.project_name}-aws-network-firewall"
  firewall_policy_arn = var.firewall_policy_arn
  vpc_id              = local.vpc_id
  # Iterate over each subnet ID and create a subnet_mapping block
  dynamic "subnet_mapping" {
    for_each = local.network_firewall_subnet_ids
    content {
      subnet_id = subnet_mapping.value
    }
  }
  tags = merge({
    Name = "${var.org_name}-${var.region_name}-${var.environment}-${var.project_name}-aws-network-firewall"
    },
    var.default_tags
  )
  timeouts {
    create = "40m"
    update = "50m"
    delete = "1h"
  }
}

#######################################################################################################
# Logging to CloudWatch
#######################################################################################################
resource "aws_cloudwatch_log_group" "this" {
  name = "${var.org_name}-${var.region_name}-${var.environment}-${var.project_name}-network-firewall-log-group"
  tags = var.default_tags
}

resource "aws_networkfirewall_logging_configuration" "this" {
  firewall_arn = aws_networkfirewall_firewall.this.arn
  logging_configuration {
    log_destination_config {
      log_destination = {
        logGroup = aws_cloudwatch_log_group.this.name
      }
      log_destination_type = "CloudWatchLogs"
      log_type             = "ALERT"
    }
    log_destination_config {
      log_destination = {
        logGroup = aws_cloudwatch_log_group.this.name
      }
      log_destination_type = "CloudWatchLogs"
      log_type             = "FLOW"
    }
  }
}
