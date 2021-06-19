module "sa" {
  source = "../../modules/sa"
}

module "vpc" {
  source = "../../modules/vpc"
  region = var.region
}

module "gke" {
  source            = "../../modules/gke"
  location          = var.location
  sa_email          = module.sa.sa_email
  vpc_id            = module.vpc.vpc_id
  subnet_id         = module.vpc.subnet_id
  subnet_range_name = module.vpc.subnet_range_name
}
