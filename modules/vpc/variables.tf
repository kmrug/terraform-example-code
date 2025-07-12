variable "vpc_name" {
  description = "The name of the VPC network"
  type = string
}

variable "routing_mode" {
  description = "The routing mode for the VPC (REGIONAL or GLOBAL)"
  type = string
  default = "REGIONAL"
}

variable "subnets" {
  description = "List of subnets to create"
  type = list(object({
    name = string
    ip_cidr_range = string
    region = string
    private_ip_google_access = bool
  }))
}

variable "firewall_rules" {
  description = "List of firewalls to apply"
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
  description = "The name of the Cloud NAT Gateway"
  type = string
}

variable "nat_region" {
  description = "The region where the Cloud NAT will be created"
  type = string
}

variable "nat_subnet_names" {
  description = "List of subnet names to apply NAT to"
  type = list(string)
}