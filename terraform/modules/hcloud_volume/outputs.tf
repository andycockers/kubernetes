output "volume_id" {
   value = hcloud_volume.volume.id
}

output "linux_device" {
   value = hcloud_volume.volume.linux_device
}