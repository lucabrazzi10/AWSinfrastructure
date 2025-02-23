resource "aws_db_instance" "db_instance" {
  allocated_storage   = 30
  storage_type        = "standard"
  engine              = "mysql"
  engine_version      = "8.0"
  instance_class      = "db.m7g.large"
  name                = "s3yomi"
  username           = "admin"
  password           = "SecurePassword123!" 
  skip_final_snapshot = true
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.web_sg.id] # Ensure security group exists
  publicly_accessible = false
}
resource "aws_security_group" "db_sg" {
  name        = "database-security-group"
  description = "Security group for database instances"
  vpc_id      = aws_vpc.my_vpc.id

 

  ingress {
    from_port   = 3306  # Adjust based on DB engine (e.g., 5432 for PostgreSQL)
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"] # Restrict access to internal VPC
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
 