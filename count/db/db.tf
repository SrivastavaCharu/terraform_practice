variable "server_names" {
  type = list(string)
  
}
resource "aws_instance" "DBServer" {
  ami = "ami-00c79d83cf718a893"
  instance_type = "t2.micro"
  count = length(var.server_names)
  tags = {
    Name = var.server_names[count.index]
  }
}

output "privateIP" {
    value = [aws_instance.DBServer.*.private_ip]
  }
