output "endpoint" {
    value = google_container_cluster.primary.endpoint
}

output "cluster_id" {
    value = google_container_cluster.primary.id
}