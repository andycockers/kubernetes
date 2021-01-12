resource "hcloud_network_subnet" "network-subnet" {
  type         = "cloud"
  network_id   = var.network_id
  network_zone = "eu-central"
  ip_range     = var.ip_range
}
  
