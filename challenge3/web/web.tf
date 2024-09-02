provider "aws" {
  region = "ap-northeast-1"
  
}

resource "aws_instance" "webserver" {
  ami = "ami-00c79d83cf718a893"
  instance_type = "t2.micro"
  security_groups = [ module.sg.sg_name ] 
  user_data = file("./web/server-script.sh")
  tags = {
    Name = "web server"
  }
}

module "public_ip" {
  source = "../eip"
  instance_id = aws_instance.webserver.public_ip
  
}
module "eip" {
  source = "../eip"
  instance_id = aws_instance.webserver.id 
}

module "sg" {
  source = "../sg"
}

output "instance_id" {
  value = aws_instance.webserver.id
  
}

output "public_ip" {
  value = module.eip.PublicIP
}