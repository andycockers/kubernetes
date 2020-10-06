data "hcloud_image" "ubuntu_slave" {
  with_selector = "type=ubuntu_slave"
}

resource "hcloud_server" "node1" {
  name        = var.server_name
  image       = var.image_name
  server_type = var.server_type
  location    = var.location

  provisioner "local-exec" {
    when    = destroy
    command = "systemctl stop swarm"
  }
}