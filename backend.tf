terraform {
  backend "s3" {
    bucket = "euran-terraform-statefile11"
    key = "jenkinsmaster"
    region = "us-east-1"
  }
}  
