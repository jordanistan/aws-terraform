module "website" {
  source = "./website"

  region = var.region
  instance_type = var.instance_type
}

module "database" {
  source = "./database"

  region = var.region
  database_name = var.database_name
  database_username = var.database_username
  database_password = var.database_password
}
