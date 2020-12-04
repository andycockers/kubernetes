resource "google_compute_instance" "default" {
  name         = var.gce_instance_name
  machine_type = var.machine_type
  zone         = var.zone
  project      = vap.project_id

    boot_disk {
    initialize_params {
      image = var.image
    }
  }

    network_interface {
    network = "default"

    access_config {
      
    }
  }

}