# Hetzner jenkins slave

module "hetzner" {
  source          = "../modules/hcloud_server"
  name            = var.server_name
  server_name     = random_pet.name.id
  server_type     = var.server_type
  location        = var.location
  ssh_keys        = var.ssh_keys
  type            = var.type
  hcloud_token    = var.hcloud_token
}

output "ipv4_address" {
   value = module.hetzner.ipv4_address
}

output "id" {
   value = module.hetzner.id
}