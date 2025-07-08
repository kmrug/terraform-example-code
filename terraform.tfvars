// This file is kind of like .env file
// It should never be pushed to Git as it contains sensitive info

project_id = "your-project-id"
bucket_name = "my-first-terraform-bucket"
bucket_location = "us-central1"
enable_versioning = true

labels = {
  environment = "dev"
  owner = "john"
}

network_name = "custom-vpc"
routing_mode = "REGIONAL"

subnets = [
  {
    name = "subnet-1"
    ip_cidr_range = "10.0.1.0/24"
    region = "us-central1"
    enable_flow_logs = true
    private_ip_google_access = true
    secondary_ip_range = [
      {
        range_name = "gke-pods"
        ip_cidr_range = "10.0.3.0/24"
      },
      {
        range_name = "gke-services"
        ip_cidr_range = "10.0.4.0/24"
      }
    ]
  },
  {
    name = "subnet-2"
    ip_cidr_range = "10.0.2.0/24"
    enable_flow_logs = false
    private_ip_google_access = false
  }  
]