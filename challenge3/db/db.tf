provider "aws" {
  region = "ap-northeast-1"
  
}

resource "aws_instance" "DBServer" {
  ami = "ami-00c79d83cf718a893"
  instance_type = "t2.micro"
  tags = {
    Name = "DB Server"
  }
}

output "DBServer_Private_IP" {
    value = aws_instance.DBServer.private_ip
  }
