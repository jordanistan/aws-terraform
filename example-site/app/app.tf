resource "aws_instance" "app" {
  ami           = "ami-0a63f96e85105ba2d"
  instance_type = "${var.instance_type}"
  key_name      = "my-key"
  security_groups = ["sg-0b5d5e75b7d8639c3"]

  tags = {
    Name = "${var.app_name}"
  }
}
