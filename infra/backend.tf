terraform {
 backend "gcs" {
   bucket  = "BUCKET_NAME" #variables are not allowed in backend configuration
   prefix  = "terraform/state"
 }
}