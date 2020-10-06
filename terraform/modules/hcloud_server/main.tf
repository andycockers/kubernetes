data "hcloud_image" "ubuntu_slave" {
  with_selector = "type=ubuntu_slave"
}

resource "hcloud_server" "node1" {
  name        = var.server_name
  image       = data.hcloud_image.ubuntu_slave.id
  server_type = var.server_type
  location    = var.location

  }