#GCP Provider 
provider "google" {
  credentials = file(var.gcp_svc_key)
  project = var.gcp_project
  region  = var.gcp_region #will we have one resource or spread out over multiple regions? 
  zone    = "us-central1-c"
}