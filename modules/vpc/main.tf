resource "google_compute_network" "vpc_network" {

  name = var.network_name
  auto_create_subnetworks = false
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

  dynamic "secondary_ip_range" {
    for_each = each.value.secondary_ip_range
    content {
      range_name = secondary_ip_range.value.range_name
      ip_cidr_range = secondary_ip_range.value.ip_cidr_range
    }
  }
}

resource "google_compute_router" "vpc_router" {
  
  name = "${var.network_name}-router"
  network = google_compute_network.vpc_network.id
  region = var.region
}

resource "google_compute_router_nat" "vpc_nat" {
  
  name = "${var.network_name}-nat"
  router = google_compute_router.vpc_router.name
  region = var.region
  nat_ip_allocate_option = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

resource "google_compute_firewall" "allow_internal" {

  name = "${var.network_name}-allow-internal"
  network = google_compute_network.vpc_network.name

  direction = "INGRESS"
  priority = 65534
  allow {
    protocol = "all"
  }

  source_ranges = [ "10.0.0.0/8" ]
}

resource "google_compute_firewall" "allow_ssh" {
  
  name = "${var.network_name}-allow-ssh"
  network = google_compute_network.vpc_network.name

  direction = "INGRESS"
  priority = 1000

  allow {
    protocol = "tcp"
    ports = ["22"]
  }
}