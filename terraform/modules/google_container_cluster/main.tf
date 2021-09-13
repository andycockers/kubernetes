resource "google_service_account" "default" {
  account_id   = "kubernetes-service-account"
  display_name = "Service Account"
  project      = var.project_id
}

resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.cluster_location
  project  = var.project_id
  provider = google-beta

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
  addons_config {
    horizontal_pod_autoscaling {
      disabled = false
    }
    http_load_balancing {
      disabled = true
    }
    gce_persistent_disk_csi_driver_config {
      enabled = true
    }
  }

  cluster_autoscaling {
    enabled = false
  }

  workload_identity_config {
  identity_namespace = "${var.project_id}.svc.id.goog"
}

}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "my-node-pool"
  location   = "us-central1-c"
  cluster    = google_container_cluster.primary.name
  node_count = var.node_count
  project  = var.project_id

  node_config {
    preemptible  = true
    machine_type = var.machine_type
    disk_size_gb = var.disk_size_gb

    workload_metadata_config {
    node_metadata = "GKE_METADATA_SERVER"
  }

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = "jenkins-test-project-284609@appspot.gserviceaccount.com"
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}