resource "random_string" "suffix" {
  length  = 8
  special = false
}

data "github_repository" "repo" {
  full_name = "gh-osi22/monacloud"
}

variable "appId" {
  description = "Service principal App ID"
}

variable "password" {
  description = "Service Principal Client Secret"
}

variable "tenantId" {
  description = "Service Principal Tenant ID"
}

variable "subscriptionId" {
  description = "Service Principal Subscription ID"
}

locals {
  cluster_name = "tf-monacloud-${random_string.suffix.result}"
  cluster_version = "1.24.3"
  github_env = "azure"
}
