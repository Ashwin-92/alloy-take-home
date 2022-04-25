//RDS Setup
resource "aws_db_parameter_group" "dbparameter" {
  name   = "rds-pg"
  family = "mysql8.0"

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8"
  }
}

resource "aws_db_subnet_group" "dbsubnet" {
  name       = "db-subnet"
  subnet_ids = [ module.VPC_Module.subnet_private1_id , module.VPC_Module.subnet_private2_id ]

  tags = {
    Name = "DB subnet group"
  }
}

resource "aws_security_group" "rdssg" {
  name        = "RDS Security Group"
  description = "allow IB/OB access to the database"
  vpc_id      = module.VPC_Module.vpc_id

  ingress {
    // protocol    = "tcp"
    // from_port   = 0
    // to_port     = 3306   //Since this is simple set up, i left it open for all other resources within VPC.  External entities do not have access to rds.
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = [ module.VPC_Module.vpc_cidr ]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = [ module.VPC_Module.vpc_cidr ]
  }

  tags = {
    Name = "DB security group"
  }
}

resource "aws_db_instance" "ash-db" {
  allocated_storage    = 100
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t2.micro"
  identifier           = "ashdb"
  name                 = "ashdb"
  username             = "root"
  password             = "Ash-RDS-DB-PW"
  parameter_group_name = aws_db_parameter_group.dbparameter.id
  db_subnet_group_name = aws_db_subnet_group.dbsubnet.id
  vpc_security_group_ids = [ aws_security_group.rdssg.id ]
  publicly_accessible  = false
  skip_final_snapshot  = true
  multi_az             = false //allows for redundancy, however I left it in single AZ
}