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
  storage_class = var.storage_class
  enable_versioning = var.enable_versioning
  labels = var.labels

}

module "custom_vpc" {

  source = "./modules/vpc"
  network_name = var.network_name
  routing_mode = var.routing_mode
  subnets = var.subnets
}