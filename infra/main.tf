module "network" {
    source = "./modules/network"
    project_id = var.gcp_project_configuration.project_id
    project_region = var.gcp_project_configuration.region
}