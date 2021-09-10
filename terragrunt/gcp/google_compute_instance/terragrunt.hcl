include {
  path = find_in_parent_folders()
}

terraform {
    source = "tfr:///terraform-google-modules/vm/google//modules/compute_instance?version=7.1.0"
}

dependency "instance_template" {
  config_path = "../gce_instance_template"
}

inputs = {
  instance_template = dependency.instance_template.outputs.self_link
}