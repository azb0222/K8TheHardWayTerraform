#used to define the input variables for this module 
variable project_id { 
    description = "contains the GCP Project ID"
    type = string 
}

variable project_region { 
    description = "contains the GCP Project region"
    type = string 
}

locals { 
    #these are used for general variables within the module, users of module cannot override
}