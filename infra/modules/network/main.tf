resource "google_compute_network" "vpc_network" {
  project                 = var.project_id
  name                    = "setting-up-k8-the-hard-way-with-terraform"
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "subnet" {
  name          = "kubernetes"
  region        = "us-central1"  # Replace with your desired region
  network       = google_compute_network.vpc_network.name
  ip_cidr_range = "10.240.0.0/24" # Can host up to 254 compute instances
}

# Allow all pods internally to communicate with one another
resource "google_compute_firewall" "allow-internal" {
  name          = "kubernetes-the-hard-way-allow-internal"
  network       = google_compute_network.vpc_network.name
  allow {
    protocol = ["tcp", "udp", "icmp"]
  }
  source_ranges = ["10.240.0.0/24", "10.200.0.0/16"]
}

#how is this secure? 
resource "google_compute_firewall" "allow-external" {
  name          = "kubernetes-the-hard-way-allow-external"
  network       = google_compute_network.vpc_network.name
  allow {
    protocol = ["tcp", "icmp"]
    ports    = ["22", "6443"]
  }
  source_ranges = ["0.0.0.0/0"] #allows external access from any ip 
}

#reserve a static external IP address to use in a sepcific region, used for load balancer
resource "google_compute_address" "external-IP-address" {
  name   = "kubernetes-the-hard-way"
  region = var.project_region  # Specify the desired GCP region here
}
