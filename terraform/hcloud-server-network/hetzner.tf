module "hetzner-server-network" {
  source       = "../modules/hcloud_server_network"
  network_id    = var.network_id
  server_id     = var.server_id
}

output "internal_ip" {
   value = module.hetzner-server-network.internal_ip
}