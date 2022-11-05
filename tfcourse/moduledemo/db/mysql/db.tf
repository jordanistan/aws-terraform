variable "dbname" {
  type = string
}


resource "aws_instance" "myec2db" {
  ami           = "ami-06d21848ee06676d0"
  instance_type = "t2.micro"

  tags = {
    Name = var.dbname
  }
}
