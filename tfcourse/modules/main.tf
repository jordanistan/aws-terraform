provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "myec2" {
  ami           = "ami-06d21848ee06676d0"
  instance_type = "t2.micro"

  tags = {
    Name = "Web Server"
  }
}

module "dbserver" {
  source = "./db"
}
