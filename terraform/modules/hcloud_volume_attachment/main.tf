resource "hcloud_volume_attachment" "main" {
  volume_id = var.volume_id
  server_id = var.server_id
  automount = true
}