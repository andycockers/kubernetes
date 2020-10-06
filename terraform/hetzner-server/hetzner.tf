# Hetzner jenkins slave

module "hetzner" {
  source          = "../modules/hetzner-server"
  name            = random_pet.random.id
  server_name     = random_pet.random.id
  image_name      = var.image_name
  server_type     = var.server_type
}