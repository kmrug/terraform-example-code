resource "google_compute_network" "vpc_network" {

  name = var.network_name
  auto_create_subnetworks = true
  routing_mode = var.routing_mode
}

resource "google_compute_subnetwork" "subnet" {

  // Loop only needed if creating multiple subnets dynamically
  for_each = { for s in var.subnets : s.name => s }
  name = each.value.name
  ip_cidr_range = each.value.ip_cidr_range
  region = each.value.region
  network = google_compute_network.vpc_network.id
  private_ip_google_access = each.value.private_ip_google_access
  # enable_flow_logs = each.value.enable_flow_logs
}