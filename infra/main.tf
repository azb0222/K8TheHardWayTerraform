# Bucket 

resource "google_storage_bucket" "example-resource" { 
    name = "example-website" #need to be globally unqiue    
    location = "US"

    tags = { 
        #used to describe metadata about the provisioned resource
    }
}

#move this to a state file 
#https://cloud.google.com/docs/terraform/resource-management/store-state
resource "google_storage_bucket" "terraform-state-bucket" { 
    name = "terraform-state-bucket" #need to be globally unqiue    
    location = "US"
    force_destroy = false 
    storage_class = "STANDARD"


    # will store full revision history of state files, good for rollbacks  
    versioning { 
        enabled = true 
    }

    encryption {
        default_kms_key_sha256 = "your-KMS-key-sha256-hash" # Replace with the KMS key you want to use
    }

      # Set permissions to restrict access to the bucket, do not make the bucket public 
  iam_configuration {
    bucket_policy_only = true
  }
}