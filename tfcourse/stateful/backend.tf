terraform {
  backend "s3" {
    bucket = "jordanistan-tfstate"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
  }
}
