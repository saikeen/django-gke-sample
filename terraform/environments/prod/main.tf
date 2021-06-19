module "cluster" {
  source   = "../../modules/cluster"
  region   = var.region
  location = var.location
}
