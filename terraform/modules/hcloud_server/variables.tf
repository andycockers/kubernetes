variable "name"         {}
variable "server_name"  {}
variable "image_name"   {}
variable "server_type"  {}
variable "location"     {}
variable "ssh_keys"     {type = list(string)}
variable "hcloud_token" {}