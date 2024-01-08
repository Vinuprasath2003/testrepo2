variable "gcp_credentials" {
  description = "GCP credentials"
}
variable "VM_NAME" {
  description = "VM name"
}

variable "MACHINE_TYPE" {
  description = "Machine Type"
}

variable "ZONE" {
  description = "Zone"
}
provider "google" {
    project ="affable-audio-410209"
    region = "us-central1"
    zone ="us-central1-a"
    credentials = file(var.gcp_credentials)
}

resource "google_compute_instance" "vm-jenkins" {
  name         = var.VM_NAME
  machine_type = var.MACHINE_TYPE
  zone         = var.ZONE

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
