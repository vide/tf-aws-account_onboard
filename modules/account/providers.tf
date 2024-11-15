terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.75"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}
