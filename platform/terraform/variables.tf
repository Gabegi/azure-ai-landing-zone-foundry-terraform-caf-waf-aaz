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

variable "ai_platform_address_space" {
  description = "Address space for the AI platform virtual network."
  type        = string
  default     = "10.1.0.0/16"
}

variable "ai_foundry_workload_address_space" {
  description = "Address space for the AI Foundry workload virtual network."
  type        = string
  default     = "10.2.0.0/16"
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
