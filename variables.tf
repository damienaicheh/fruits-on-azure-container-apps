variable "environment" {
  description = "The environment deployed"
  type        = string
  default     = "dev"
  validation {
    condition     = can(regex("(dev|stag|prod)", var.environment))
    error_message = "The environment value must be valid."
  }
}

variable "region" {
  description = "Azure deployment region"
  type        = string
  default     = "we"
}

variable "application" {
  description = "The name of the application"
  type        = string
  default     = "frt"
}

variable "location" {
  description = "Azure deployment location"
  type        = string
  default     = "westeurope"
}

variable "resource_group_name_suffix" {
  type        = string
  default     = "01"
  description = "The resource group name suffix"
  validation {
    condition     = can(regex("[0-9]{2}", var.resource_group_name_suffix))
    error_message = "The resource group name suffix value is not a valid number."
  }
}

variable "repository" {
  description = "The repository name"
  type        = string
  default     = "fruits_on_azure_container_apps"
}

variable "creator" {
  description = "The name of the project's creator"
  type        = string
  default     = "terraform"
}

variable "tags" {
  type        = map(any)
  description = "The custom tags for all resources"
  default     = {}
}
