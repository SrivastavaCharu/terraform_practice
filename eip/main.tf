provider "aws" {
  region = "ap-northeast-1" 
}

resource "aws_instance" "ec2" {
  ami = "ami-00c79d83cf718a893"
  instance_type = "t2.micro"
}

resource "aws_eip" "elasticeip" {
  instance = aws_instance.ec2.id
}

output "EIP" {
  value = aws_eip.elasticeip.public_ip
}