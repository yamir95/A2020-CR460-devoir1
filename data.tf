data "google_compute_network" "devoir1" {
  name = "default"
  
}

data "google_project" "default-project" {
  project_id = var.project_id
}
