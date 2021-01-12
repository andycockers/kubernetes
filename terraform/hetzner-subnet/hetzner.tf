# Hetzner jenkins slave

module "hetzner" {
  source          = "../modules/hcloud_network_subnet"
  network_id      = var.network_id
  ip_range        = var.ip_range
  hcloud_token    = var.hcloud_token

}

output "ip_range"     {
   value = module.hetzner.ip_range
}