variable "instance_name" {
  description = "Name of the MySQL instance"
  type = string
}

variable "database_version" {
  description = "MySQL version to use (e.g., MYSQL_8_0)"
  type = string
}

variable "region" {
  description = "Region to create the MySQL instance in"
  type = string
}

variable "tier" {
  description = "Machine type for instance (e.g., db-f1-micro)"
  type = string
}

variable "root_password" {
  description = "Root password for the default MySQL user"
  type = string
  sensitive = true
}