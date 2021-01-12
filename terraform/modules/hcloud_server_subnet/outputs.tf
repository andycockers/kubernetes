output "ipv4_address" {
   value = hcloud_server.node1.ipv4_address
}

output "ip_range" {
  value = hcloud_network_subnet.network-subnet.ip_range
}