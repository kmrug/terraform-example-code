resource "google_compute_instance" "vm" {
  
  name = var.instance_name
  machine_type = var.machine_type
  zone = var.zone
  project = var.project_id

  boot_disk { # Sets the image of the instance
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204 lts"
    }
  }

  network_interface {
    network = var.network
    subnetwork = var.subnetwork
    access_config {} # Enables external IP
  }
}