variable "name" {
  description = "Name of the GCS bucket"
  type = string
}

variable "location" {
  description = "Location of the bucket (e.g. US, ASIA)"
  type = string
}

variable "project_id" {
  description = "GCP project ID"
  type = string
}