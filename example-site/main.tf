# Configure the AWS provider
provider "aws" {
  region = "us-east-1"
}

# Define the application module
module "app" {
  source = "./modules/app"

  app_name   = "my-app"
  instance_type = "t2.micro"
}

# Define the database module
module "db" {
  source = "./modules/db"

  db_name = "my-db"
  instance_type = "db.t2.micro"
  username = "admin"
  password = "password"
}
