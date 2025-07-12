output "instance_connection_name" {
  description = "Connection name used for clients to connect (e.g., via Cloud SQL Proxy)"
  value = google_sql_database_instance.mysql.connection_name
}

output "instance_self_link" {
  description = "The self-link of the instance"
  value = google_sql_database_instance.mysql.self_link
}

output "instance_name" {
  description = "The name of the MySQL instance"
  value = google_sql_database_instance.mysql.name
}