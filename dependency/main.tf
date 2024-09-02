provider "aws"{
    region = "ap-northeast-1"
}

resource "aws_instance" "db" {
  ami = "ami-00c79d83cf718a893"
    instance_type = "t2.micro"
}

resource "aws_instance" "web" {
  ami = "ami-00c79d83cf718a893"
    instance_type = "t2.micro"
    depends_on = [ aws_instance.db ]
}

