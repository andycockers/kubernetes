data "hcloud_image" "ubuntu_server" {
  with_selector = var.type
}

resource "hcloud_network_subnet" "network-subnet" {
  type         = "cloud"
  network_id   = var.network_id
  network_zone = "eu-central"
  ip_range     = var.ip_range
}

resource "hcloud_server" "node1" {
  name        = var.server_name
  image       = data.hcloud_image.ubuntu_server.id #The ID is displayed when the image is created
  server_type = var.server_type
  location    = var.location
  ssh_keys    = var.ssh_keys
  
  network {
      network_id = var.network_id
      ip         = var.ip
      alias_ips  = []
  }

  depends_on = [
    hcloud_network_subnet.network-subnet
  ]

  }
  
