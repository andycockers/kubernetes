terraform {
  required_providers {
    hcloud = {
      # The "hashicorp" namespace is the new home for the HashiCorp-maintained
      # provider plugins.
      #
      # source is not required for the hashicorp/* namespace as a measure of
      # backward compatibility for commonly-used providers, but recommended for
      # explicitness.
      source  = "hashicorp/hcloud"
      version = "~> 1.23.0"
    }

provider "hcloud" {
  token = var.hcloud_token
}

data "hcloud_image" "ubuntu_slave" {
  with_selector = "type=ubuntu_slave"
}

resource "hcloud_server" "node1" {
  name        = var.server_name
  image       = data.hcloud_image.ubuntu_slave.id #The ID is displayed when the image is created
  server_type = var.server_type
  location    = var.location
  ssh_keys    = var.ssh_keys

  }
  }
}