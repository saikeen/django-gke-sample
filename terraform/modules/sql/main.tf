locals {
  env_resource_prefix = "${var.app_name}-${var.env}"
}

resource "random_id" "db_name_suffix" {
  byte_length = 4
}

resource "google_sql_database_instance" "master" {
  name                = "${local.env_resource_prefix}-db-${random_id.db_name_suffix.hex}"
  database_version    = "MYSQL_8_0"
  region              = var.region
  deletion_protection = false

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_database" "database" {
  name     = var.db_name
  instance = google_sql_database_instance.master.name
}

resource "google_sql_user" "users" {
  instance = google_sql_database_instance.master.name
  name     = var.db_user_name
  password = var.db_user_pass
}
