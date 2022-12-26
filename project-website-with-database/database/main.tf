resource "aws_db_instance" "database" {
  engine                  = "MySQL"
  instance_class          = "db.t2.micro"
  name                    = var.database_name
  username                = var.database_username
  password                = var.database_password
  allocated_storage       = 20
  storage_type            = "gp2"
  vpc_security_group_ids  = ["sg-12345"]
  publicly_accessible     = true
}
