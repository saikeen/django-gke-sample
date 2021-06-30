module "sa" {
  source = "../../modules/sa"
}

module "iam" {
  source              = "../../modules/iam"
  sql_client_sa_email = module.sa.sql_client_sa_email
}

module "secret" {
  source                    = "../../modules/secret"
  sql_client_sa_private_key = module.sa.sql_client_sa_private_key
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
}
