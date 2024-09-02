provider "aws" {
  region = "ap-northeast-1"
  
}

resource "aws_vpc" "Challenege1VPC" {
  cidr_block = "192.168.0.0/24"
  tags = {
    Name = "TerraformVPC"
  }
  
}