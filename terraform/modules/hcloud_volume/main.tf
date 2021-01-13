resource "hcloud_volume" "volume" {
  name     = var.volume_name
  size     = var.volume_size
  location = var.location
  }
  