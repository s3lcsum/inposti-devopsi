terraform {
  required_version = ">= 1.11.4"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.5.0, < 7.0.0"
    }
  }
}
