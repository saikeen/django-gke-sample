module "sa" {
  source = "../../modules/sa"
}

module "iam" {
  source                 = "../../modules/iam"
  gke_node_pool_sa_email = module.sa.gke_node_pool_sa_email
  sql_proxy_sa_email     = module.sa.sql_proxy_sa_email
}

module "vpc" {
  source   = "../../modules/vpc"
  region   = var.region
  app_name = var.app_name
  env      = var.env
}

module "sql" {
  source       = "../../modules/sql"
  region       = var.region
  app_name     = var.app_name
  env          = var.env
  db_name      = var.db_name
  db_user_name = var.db_user_name
  db_user_pass = var.db_user_pass
}

module "gke" {
  source                 = "../../modules/gke"
  location               = var.location
  app_name               = var.app_name
  env                    = var.env
  gke_node_pool_sa_email = module.sa.gke_node_pool_sa_email
  vpc_id                 = module.vpc.vpc_id
  subnet_id              = module.vpc.subnet_id
  subnet_range_name      = module.vpc.subnet_range_name
}
