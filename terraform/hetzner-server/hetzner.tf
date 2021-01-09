# Hetzner jenkins slave

module "hetzner" {
  source          = "../modules/hcloud_server"
  name            = var.server_name
  server_name     = var.server_name
  #image_name      = var.image_name
  server_type     = var.server_type
  location        = var.location
  ssh_keys        = var.ssh_keys
}