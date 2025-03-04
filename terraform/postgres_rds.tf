module "rds" {
  source = "terraform-aws-modules/rds/aws"

  version = "5.1.0"

  identifier = "enterprise-service-rds-db"

  engine                = "postgres"
  engine_version        = "15"
  family                = "postgres15"
  instance_class        = var.db_instance_type
  allocated_storage     = 10
  max_allocated_storage = 50
  db_name               = var.db_name
  username              = var.db_username
  password              = var.db_password
  port                  = 5432

  publicly_accessible    = false
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name

  multi_az                = false
  backup_retention_period = 5
  storage_encrypted       = true
  skip_final_snapshot     = true
}

resource "aws_security_group" "rds_sg" {
  name        = "${var.project_name}-rds-sg"
  description = "Security group for RDS PostgreSQL"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = module.vpc.private_subnets_cidr_blocks
  }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.project_name}-rds-subnet-group"
  subnet_ids = module.vpc.private_subnets
}

