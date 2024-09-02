provider "aws" {
  region = "ap-northeast-1"
}

module "ec2Module" {
  source = "./ec2"
  ec2Name = "Name from the module"
  
}

output "nameFromModule" {
  value = module.ec2Module.ec2Name
  
}