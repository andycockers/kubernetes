terraform {
  required_providers {
    hcloud = {
      # The "hashicorp" namespace is the new home for the HashiCorp-maintained
      # provider plugins.
      #
      # source is not required for the hashicorp/* namespace as a measure of
      # backward compatibility for commonly-used providers, but recommended for
      # explicitness.
      source  = "hetznercloud/hcloud"
      version = "~> 1.23.0"
    }
  }
}