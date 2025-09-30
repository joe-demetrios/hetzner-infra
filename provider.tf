terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
  }
  backend "s3" {
    bucket         = "demetrios-cloud-terraform"
    key            = "terraform/hetzner-infra.tfstate"
    region         = "eu-central-1"
    use_lockfile   = true
  }
}

provider "hcloud" {
  token = var.api_token
}