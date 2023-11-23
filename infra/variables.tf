#change to use this 
variable "gcp_project_configuration" { 
    description = "contains the GCP Project configuration"
    type = object({
        gcp_project = string 
        gcp_region = string
    })
    default = { 
        gcp_project = "settingupk8thehardway"
        gcp_region = "us-central1"
    }
}

variable "gcp_svc_key" { 
   default = "./auth/settingupk8thehardway-733f6118197a.json"
}

//can move the above variables into a key 