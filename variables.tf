variable "project_id" {
  description = "GCP Project ID"
  type = string
}
variable "bucket_name" {}
variable "bucket_location" {
  default = "US"
}

variable "network_name" {
  type = string
  description = "The name of the VPC"
}

variable "routing_mode" {
  type = string
  default = "REGIONAL"
}

variable "subnets" {
  description = "Subnets to create inside the VPC"
  type = list(object({
    name = string
    ip_cidr_range = string
    region = string
    private_ip_google_access = bool
    secondary_ip_range = optional(list(object({
      range_name = string
      ip_cidr_range = string
    })))
  }))
}

variable "region" {
  type = string
  description = "Region used in provider and other resources"
}

variable "firewall_rules" {
  description = "List of firewall rules to apply to the VPC"
  type = list(object({
    name = string
    direction = string
    priority = number
    source_ranges = list(string)
    allow = list(object({
      protocol = string
      ports = optional(list(string))
    }))
  }))
}

variable "router_name" {
  
  description = "The name of the Cloud Router"
  type = string
}

variable "router_region" {
  
  description = "The region where the Cloud Router will be created"
  type = string
}

variable "nat_name" {
  description = "Name of the Cloud NAT Gateway"
  type = string
}

variable "nat_region" {
  description = "Region for the Cloud NAT Gateway"
  type = string
}

variable "nat_subnet_names" {
  description = "List of subnet names that should use NAT"
  type = list(string)
}

variable "instance_name" {
  description = "Name of the VM instance"
  type = string
}

variable "machine_type" {
  description = "Machine type for the VM"
  type = string
}

variable "zone" {
  description = "Zone for the VM"
  type = string
}

variable "mysql_instance_name" {
  description = "The name of the MySQL Cloud SQL instance"
  type = string
}

variable "mysql_database_version" {
  description = "The MySQL version to use (e.g., MYSQL_8_0)"
  type = string
}

variable "mysql_region" {
  description = "The region to deploy the MySQL instance"
  type = string
}

variable "mysql_tier" {
  description = "The tier (machine type) for the MySQL instance"
  type = string
}

variable "mysql_root_password" {
  description = "Root password for the MySQL instance"
  type = string
  sensitive = true
}