provider "aws" {
  region = "ap-northeast-1"
  
}

module "DBServer" {
  source = "./db"
  
}

module "webserver" {
  source = "./web"
  
}

output "DBServer_Private_IP" {
    value = module.DBServer.DBServer_Private_IP
  }

output "WebServer_Public_IP" {
    value = module.webserver.public_ip
  
}