terraform {
  backend "gcs" {
    bucket = "python-gke-sample-tfstate"
    prefix = "env/prod"
  }
}