data "hcloud_image" "ubuntu_server" {
  with_selector = var.type
}

resource "hcloud_server" "node1" {
  name        = var.server_name
  image       = data.hcloud_image.ubuntu_server.id #The ID is displayed when the image is created
  server_type = var.server_type
  location    = var.location
  ssh_keys    = var.ssh_keys
  
  network {
      network_id = var.network_id
  }

  
  }
  
