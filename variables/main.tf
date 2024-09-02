provider "aws" {
  region = "ap-northeast-1"
  
}

variable "vpcname" {
  type        = string
  default = "myvpc"
  
}

variable "sshport" {
  type        = number
  default = 22
  
}

variable "enabledns" {
  type        = bool
  default = true
  
}

variable "mylist" {
  type        = list(string)
  default = ["one", "two", "three"]
  
}

variable "mymap" {
  type        = map(string)
  default = {
    key1 = "value1"
    key2 = "value2"
  }
  
}

variable "inputname" {
  type        = string
  description = "Set the name of the VPC"
  
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"

    tags = {
        Name = var.inputname
    }
}

output "vpcid" {
  value = aws_vpc.myvpc.id
}

variable "mytuple" {
  type = tuple([ string, number, string ])
  default = [ "dog", 2, "cat" ]
}

variable "myobject" {
  type = object({
    name = string
    port  = list(number)
  })
  default = {
    name = "Charu"
    port  = [22, 25, 80]
  }
  
}