resource "hcloud_server" "node1" {
  name        = var.server_name
  image       = var.image_name
  server_type = var.server_type
  location    = var.location
}