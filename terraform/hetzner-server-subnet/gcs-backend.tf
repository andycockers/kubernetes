terraform {	
  backend "gcs" {	
    bucket = "automation-statefiles"	
    prefix = "hetzner-server-subnet"	
  }	
} 