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

module "vm_instance" {  

  source = "./modules/vm_instance"
  instance_name = var.instance_name
  machine_type = var.machine_type
  zone = var.zone
  project_id = var.project_id
  network = var.network_name
  subnetwork = var.subnets[0].name # "subnet-1" # This must match the actual subnet name defined in VPC config
}

module "mysql_instance" {

  source = "./modules/mysql_instance"
  instance_name = var.mysql_instance_name
  database_version = var.mysql_database_version
  region = var.mysql_region
  tier = var.mysql_tier
  root_password = var.mysql_root_password 

}