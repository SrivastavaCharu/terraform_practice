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

resource "aws_instance" "webserver" {
  ami = "ami-00c79d83cf718a893"
  instance_type = "t2.micro"
  security_groups = [ aws_security_group.webserverSG.name ]
  user_data = file("server-script.sh")
  tags = {
    Name = "web server"
  }
}

resource "aws_eip" "fixedpublicIP" {
  instance = aws_instance.webserver.id
  
}

variable "ingress" {
  type = list(number)
  default = [ 80,443 ]
}

variable "egress" {
  type = list(number)
  default = [ 80,443 ]
}

resource "aws_security_group" "webserverSG" {
  name = "Allow Web Traffic"
  dynamic "ingress" {
    iterator = port
    for_each = var.ingress
    content {
        from_port = port.value
        to_port = port.value
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
}
dynamic "egress" {
    iterator = port
    for_each = var.egress
    content {
        from_port = port.value
        to_port = port.value
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
}
}

output "DBServer_Private_IP" {
    value = aws_instance.DBServer.private_ip
  }

output "WebServer_Public_IP" {
    value = aws_eip.fixedpublicIP.public_ip
  
}