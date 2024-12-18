terraform {
  backend "s3" {
    bucket = "euran-terraform-statefile11"
    key = "server_name"
    region = "us-east-1"
  }
}  
