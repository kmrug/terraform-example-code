variable "instance_name" {
  description = "Name of the VM instance"
  type = string
}

variable "machine_type" {
  description = "Machine type (e.g., e2-micro)"
  type = string
}

variable "zone" {
  description = "Zone where the VM will be deployed"
  type = string
}

variable "network" {
  description = "The name of the VPC network"
  type = string
}

variable "subnetwork" {
  description = "The name of the subnetwork"
  type = string
}

variable "project_id" {
  description = "GCP Project ID"
  type = string
}