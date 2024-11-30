output "aws_network_firewall_id" {
  value = aws_networkfirewall_firewall.this.id
}

output "aws_network_firewall_cloudwatch_log_group" {
  value = aws_cloudwatch_log_group.this.name
}
