// This file is kind of like .env file
// It should never be pushed to Git as it contains sensitive info

project_id = "my-gcp-project-id"
bucket_name = "my-first-terraform-bucket"
bucket_location = "us-central1"

network_name = "custom-vpc"
routing_mode = "REGIONAL"

subnets = [
  {
    name = "subnet-1"
    ip_cidr_range = "10.0.1.0/24"
    region = "us-central1"
    private_ip_google_access = true
  },
  {
    name = "subnet-2"
    ip_cidr_range = "10.0.2.0/24"
    region = "us-central1"
    private_ip_google_access = false
  }
]

firewall_rules = [
  {
    name          = "allow-internal"
    direction     = "INGRESS"
    priority      = 1000
    source_ranges = ["10.0.0.0/8"]
    allow = [
      {
        protocol = "tcp"
        ports    = ["0-65535"]
      },
      {
        protocol = "udp"
        ports    = ["0-65535"]
      },
      {
        protocol = "icmp"
      }
    ]
  }
]

router_name = "custom-router"
router_region = "us-central1"

nat_name = "custom-nat"
nat_region = "us-central1"
nat_subnet_names = ["subnet-1", "subnet-2"]

instance_name = "First Terraform VM"
machine_type = "e2-micro"
zone = "us-central1-a"

mysql_instance_name = "my-mysql-db"
mysql_database_version = "MYSQL_8_0" # Need to confirm this
mysql_region = "us-central1"
mysql_tier = "db-f1-micro"
mysql_root_password = "value" # Need to change later