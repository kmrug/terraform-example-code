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

variable "storage_class" {
  description = "Storage class (e.g. STANDARD, NEARLINE)"
  type = string
  default = "STANDARD"
}

variable "enable_versioning" {
  description = "Enable versioning"
  type = bool
  default = false
}

variable "labels" {
  description = "Labels to apply to the bucket"
  type = map(string)
  default = {}
}
