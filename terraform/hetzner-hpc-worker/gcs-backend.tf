terraform {	
  backend "gcs" {	
    bucket = "automation-statefiles"	
    prefix = "hetzner-hpc-worker"	
  }	
} 