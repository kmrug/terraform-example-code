/*
The following layout for this project follows a modular approach to maximize reusability. It can be thought of as a blueprint
It is also possible to follow a more hardcoded monolithic approach but that
reduces the reusability of the code
*/

module "my_bucket_name" {

  source = "./modules/gcs_bucket"
  name = var.bucket_name
  location = var.bucket_location
  project_id = var.project_id
}

module "custom_vpc" {

  source = "./modules/vpc"
  vpc_name = var.network_name
  routing_mode = var.routing_mode
  subnets = var.subnets
  firewall_rules = var.firewall_rules
  router_name = var.router_name
  router_region = var.router_region
  nat_name = var.nat_name
  nat_region = var.nat_region
  nat_subnet_names = var.nat_subnet_names
}

# module "vm_instance" {  
#   source = "./modules/vm_instance"
#   name = var.vm_name  
# }