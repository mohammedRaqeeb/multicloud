
resource "random_string" "suffix" {
  length  = 8
  special = false
}

variable "region" {
  default     = "ap-south-1"
  description = "AWS region"
}

data "github_repository" "repo" {
  full_name = "gh-osi22/monacloud"
}

locals {
  cluster_name = "tf-monacloud-${random_string.suffix.result}"
  cluster_version = "1.21"
  vpc_name = "vpc-${local.cluster_name}"
  github_env = "aws"
}
