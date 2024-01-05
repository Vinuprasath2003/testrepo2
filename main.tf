resource "google_compute_instance" "vm-for-terraform" {
  name         = "vm-terraform"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

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
