output "vpc_id" {
  value = google_compute_network.vpc_network.id
}

output "subnet_names" {
  value = [for s in google_compute_subnetworks.subnet : s.name]
}