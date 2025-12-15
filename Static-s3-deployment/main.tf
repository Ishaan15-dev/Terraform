module "static_site" {
  source = "./module/"

  bucket_name     = var.bucket_name
  project         = var.project
  index_file_path = var.index_file_path
}
