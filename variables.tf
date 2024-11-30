variable "org_name" {
  description = "Organization name used for the resource provisioning."
  type        = string
  default     = ""
}
variable "region_name" {
  description = "AWS region used in the naming convention."
  type        = string
  default     = ""
}
variable "environment" {
  description = "Environment name used in the naming convention."
  type        = string
  default     = ""
}
variable "project_name" {
  description = "Project name used in the naming convention."
  type        = string
  default     = ""
}
variable "default_tags" {
  description = "Tags used with all the resources provisioned by this script."
  type        = map(string)
  default     = {}
}
variable "vpc_ssm_id" {
  description = "Parameter store name from where the VPC ID will be referenced."
  type        = string
  default     = ""
}
variable "network_firewall_ssm_id" {
  description = "Parameter store name from where the subnet IDs will be referenced for provisioning the firewall."
  type        = string
  default     = ""
}
variable "firewall_policy_arn" {
  description = "policy ARN"
  type        = string
  default     = ""
}
