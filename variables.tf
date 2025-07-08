variable "project_id" {}
variable "bucket_name" {}
variable "bucket_location" {
  default = "US"
}
variable "storage_class" {
  default = "STANDARD"
}
variable "enable_versioning" {
  default = false
}
variable "labels" {
  default = {}
}

variable "network_name" {}
variable "routing_mode" {
  default = "REGIONAL"
}
variable "subnets" {}