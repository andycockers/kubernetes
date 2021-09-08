include {
  path = find_in_parent_folders()
}

terraform {
    source = "../../terraform//modules/google_compute_instance/"
}

inputs = {
    gce_instance_name = "terragrunt-instance"
    machine_type      = "e2-micro"
    zone              = "europe-west2-b"
    image             = "ubuntu-2004-focal-v20210825"
    project_id        = "norse-acrobat-203806"
}