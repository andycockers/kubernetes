include {
  path = find_in_parent_folders()
}

terraform {
    source = "../../../terraform/modules//google_container_cluster/"
}

inputs = {
  cluster_location = "us-central1-c"
  cluster_name     = "test-cluster"
  machine_type     = "e2-micro"
  project_id       = "jenkins-test-project-284609"
  node_count       = "3"
}