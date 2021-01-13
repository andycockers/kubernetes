module "hetzner-volume" {
  source       = "../modules/hcloud_volume"
  volume_name  = random_pet.name.id
  volume_size  = var.volume_size
  location     = var.location
}

output "volume_id" {
   value = module.hetzner-volume.volume_id
}

output "linux_device" {
  value = module.hetzner-volume.linux_device
}