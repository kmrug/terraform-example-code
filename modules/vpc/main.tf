resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
  routing_mode            = var.routing_mode
}

resource "google_compute_subnetwork" "subnet" {
  for_each = { for subnet in var.subnets : subnet.name => subnet }

  name                     = each.value.name
  ip_cidr_range            = each.value.ip_cidr_range
  region                   = each.value.region
  network                  = google_compute_network.vpc_network.id
  private_ip_google_access = each.value.private_ip_google_access
  dynamic "secondary_ip_range" {
    for_each = lookup(each.value, "secondary_ip_range", [])

    content {
      range_name    = secondary_ip_range.value.range_name
      ip_cidr_range = secondary_ip_range.value.ip_cidr_range
    }
  }
}

resource "google_compute_firewall" "vpc_firewall" {

  for_each = { for rule in var.firewall_rules : rule.name => rule }

  name          = each.value.name
  direction     = each.value.direction
  priority      = each.value.priority
  source_ranges = each.value.source_ranges
  dynamic "allow" {
    for_each = each.value.allow

    content {
      protocol = allow.value.protocol
      ports    = lookup(allow.value, "ports", null)
    }
  }

  network = google_compute_network.vpc_network.name
}

resource "google_compute_router" "cloud_router" {

  name    = var.router_name
  region  = var.router_region
  network = google_compute_network.vpc_network.name
}

resource "google_compute_router_nat" "cloud_nat" {

  name                               = var.nat_name
  router                             = google_compute_router.cloud_router.name
  region                             = var.nat_region
  nat_ip_allocate_option             = "AUTO_ONLY"           # "AUTO_ONLY" means Google will manage external IPs
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS" # "LIST_OF_SUBNETWORKS" lets you define which subnets use NAT

  dynamic "subnetwork" { # Loops over the names of subnets you want to enable NAT for
    for_each = toset(var.nat_subnet_names)

    content {
      name                    = each.value
      source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
    }

  }

}
