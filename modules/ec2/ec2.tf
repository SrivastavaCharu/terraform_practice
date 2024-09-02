variable "ec2Name" {
  type = string
}

resource "aws_instance" "ec2" {
  ami = "ami-00c79d83cf718a893"
  instance_type = "t2.micro"
  tags = {
    Name = var.ec2Name
  }
}

output "ec2Name" {
  value = aws_instance.ec2.tags.Name
  
}