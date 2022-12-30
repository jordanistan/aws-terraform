# Create an RDS instance for the database
resource "aws_db_instance" "db" {
  identifier           = "${var.db_name}"
  instance_class       = "${var.instance_type}"
  username             = "${var.username}"
  password             = "${var.password}"
  vpc_security_group_ids = ["sg-0b5d5e75b7d8639c3"]

  tags = {
    Name = "${var.db_name}"
  }
}
