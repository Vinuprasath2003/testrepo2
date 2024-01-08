variable "gcp_credentials" {
  description = "GCP credentials"
}
variable "vm_name" {
  description = "VM name"
}

variable "machine_type" {
  description = "Machine Type"
}

variable "zone" {
  description = "Zone"
}
provider "google" {
    project ="affable-audio-410209"
    region = "us-central1"
    zone ="us-central1-a"
    credentials = file(var.gcp_credentials)
}

resource "google_compute_instance" "vm-jenkins" {
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }
  network_interface {
    network = "default"
    
    access_config {
      // Specify an external IP address here if needed
    }
  }

}
