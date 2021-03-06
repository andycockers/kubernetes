# Kubernetes Config

module "test-kubernetes" {
    source             = "../modules/google_container_cluster"
    cluster_location   = var.region
    cluster_name       = var.cluster_name
    machine_type       = var.machine_type
    node_pool_location = var.region
    node_pool_name     = var.node_pool_name
    password           = var.password
    project_id         = var.project_id
    username           = var.username
}

output "google_container_cluster" {
    value = module.test-kubernetes
}