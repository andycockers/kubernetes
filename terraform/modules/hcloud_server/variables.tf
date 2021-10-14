variable "name"         {}
variable "server_name"  {}
variable "server_type"  {}
variable "location"     {}
variable "ssh_keys"     {type = list(string)}
variable "HCLOUD_TOKEN" {}
variable "type"         {}
variable "node_count"   {}
variable "network_id"   {}
