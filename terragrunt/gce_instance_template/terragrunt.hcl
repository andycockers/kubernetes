include {
  path = find_in_parent_folders()
}

terraform {
    source = "tfr:///terraform-google-modules/vm/google//modules/instance_template?version=7.1.0"
}

inputs = {
    machine_type = "e2-micro"
    source_image = "ubuntu-2004-focal-v20210825"
    source_image_project = "ubuntu-os-cloud"
    service_account = {
        email  = "instance-template@norse-acrobat-203806.iam.gserviceaccount.com"
        scopes = ["cloud-platform",
        ]
    }

    
}