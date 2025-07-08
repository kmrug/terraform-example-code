variable "network_name" {
  description = "Name of VPC network"
  type = string
}

variable "routing_mode" {
  description = "Routing mode (GLOBAL or REGIONAL)"
  type = string
  default = "REGIONAL"
}

variable "subnets" {
  description = "List of subnets to create with optional secondary IP ranges"
  type = list(object({
    name = string
    ip_cidr_range = string
    region = string
    enable_flow_logs = bool
    private_ip_google_access = bool
    secondary_ip_range = optional(list(object({
      range_name = string
      ip_cidr_range = string
    })), [])
  }))

}

variable "region" {
    description = "Region for the VPC and related components"
    type = string
    default = "us-central1"
}