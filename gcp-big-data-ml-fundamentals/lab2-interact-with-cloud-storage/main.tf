provider "google" {
  project       = "${var.project}"
  region        = "${var.region}"
  zone          = "${var.zone}"
}

resource "google_compute_instance" "vm_instance" {
  name         = "instance-1"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  # Use Default network
  network_interface {
    network       = "default"
    access_config = {}
  }

  # Use default Google Compute Engine service account
  service_account {
    # Allow full access to all Cloud APIs
    scopes = ["cloud-platform"]
  }

  metadata {
    # Allow ssh using local ssh file
    sshKeys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
    # Startup script according to lab instructions
    startup-script = <<SCRIPT
apt-get update
apt-get -y -qq install git
git --version
git clone https://github.com/GoogleCloudPlatform/training-data-analyst /opt/training-data-analyst
SCRIPT
  }
}