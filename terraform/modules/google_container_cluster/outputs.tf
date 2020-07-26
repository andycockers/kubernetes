output "endpoint" {
    value = google_container_cluster.primary.endpoint
}

output "client_certificate" {
    value = google_container_cluster.primary.master_auth.0.client_certificate 
}

output "client_key" {
    value = google_container_cluster.primary.master_auth.0.client_key 
}

output "car_cert" {
    value = google_container_cluster.primary.master_auth.0.cluster_ca_certificate
}

output "cluster_id" {
    value = google_container_cluster.primary.id
}