provider "aws" {
  region = "ap-northeast-1"
  
}

resource "aws_db_instance" "myRDS" {
    allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mariadb"
  engine_version       = "10.11.8"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  skip_final_snapshot  = true
}

  