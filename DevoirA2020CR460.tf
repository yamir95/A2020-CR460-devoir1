resource "google_compute_instance" "Yamir1" {
  name         = "canard"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.prod-dmz.name
    access_config {
    }
  }
  metadata_startup_script = "apt-get -y update && apt-get -y upgrade && apt-get -y install apache2 && systemctl start apache2"
}

resource "google_compute_instance" "Yamir2" {
  name         = "mouton"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "fedora-coreos-cloud/fedora-coreos-stable"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.prod-interne.name
    access_config {
    }
  }
  metadata_startup_script = "apt-get -y update && apt-get -y upgrade"
}

resource "google_compute_instance" "Yamir3" {
  name         = "cheval"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "fedora-coreos-cloud/fedora-coreos-stable"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.prod-traitement.name
    access_config {
    }
  }
  metadata_startup_script = "apt-get -y update && apt-get -y upgrade"
}

resource "google_compute_instance" "Yamir4" {
  name         = "fermier"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network = data.google_compute_network.devoir1.name
    access_config {
    }
  }
  metadata_startup_script = "apt-get -y update && apt-get -y upgrade"
}
