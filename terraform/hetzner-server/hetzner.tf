# Hetzner jenkins slave

module "hetzner" {
  source          = "../modules/hcloud_server"
  name            = var.server_name
  server_name     = var.server_name
  image           = var.image_name
  server_type     = var.server_type
  location        = var.location
}