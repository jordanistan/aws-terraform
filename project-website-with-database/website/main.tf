resource "aws_instance" "web" {
  ami           = "ami-0d5d9d301c853a04a"
  instance_type = var.instance_type
  key_name      = "my-key-pair"
  security_groups = ["my-security-group"]

  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("path/to/my-key-pair.pem")
  }

  provisioner "remote-exec" {
    inline = [
      "echo Hello, World > index.html",
      "nohup python -m SimpleHTTPServer 80 &",
    ]
  }
}
