resource "random_pet" "name" {
  length = 2
}

output "server_name" {
  value = random_pet.name.id
}