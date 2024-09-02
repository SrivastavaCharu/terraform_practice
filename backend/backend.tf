terraform {
  backend "s3" {
    key = "terraform/tfstate.tfstate"
    bucket = "tf-remote-backend-2024"
    region = "ap-northeast-1"
    access_key = ""
    secret_key = ""
  }
}