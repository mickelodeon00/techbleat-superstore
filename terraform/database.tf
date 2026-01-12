

resource "aws_db_instance" "postgres" {
  identifier           = "techbleat-db"
  engine               = "postgres"
  engine_version       = "17.4"
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  storage_type         = "gp2"
  
  db_name  = "postgres"
  username = var.db_username
  password = var.db_password
  
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  publicly_accessible    = false
  skip_final_snapshot    = true  # don't save backup when destroy
  
  tags = {
    Name = "techbleat-database"
  }
}