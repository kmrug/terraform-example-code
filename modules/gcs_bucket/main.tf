resource "google_storage_bucket" "my_gcs_bucket" {

  name = var.name
  location = var.location
  project = var.project_id
}