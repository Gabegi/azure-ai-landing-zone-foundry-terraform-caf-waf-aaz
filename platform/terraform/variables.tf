variable "location" {
  description = "Primary Azure region for all platform resources."
  type        = string
  default     = "westeurope"
}

variable "management_group_root_id" {
  description = "ID of the root management group."
  type        = string
  default     = "AI-LZ-Playground"
}

variable "hub_address_space" {
  description = "Address space for the hub virtual network."
  type        = string
  default     = "10.0.0.0/16"
}

variable "log_analytics_retention_days" {
  description = "Retention period in days for Log Analytics workspace."
  type        = number
  default     = 90
}

variable "tags" {
  description = "Tags applied to all resources in this layer."
  type        = map(string)
  default     = {}
}
