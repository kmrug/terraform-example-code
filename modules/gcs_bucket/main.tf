resource "google_storage_bucket" "default" {

  name = var.name
  location = var.location
  project = var.project_id

  storage_class = var.storage_class

  uniform_bucket_level_access = true

  versioning {
    enabled = var.enable_versioning
  }

  labels = var.labels
}