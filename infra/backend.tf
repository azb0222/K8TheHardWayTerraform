terraform {
 backend "gcs" {
   bucket  = "k8-the-hard-way-terraform-state-bucket" #variables are not allowed in backend configuration
   prefix  = "terraform/state"
 }
}