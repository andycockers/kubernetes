provider "google" {
    region                   = var.region
    zone                     = var.zone
    project                  = random_pet.random.id
}