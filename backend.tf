terraform {
  backend "s3" {
    bucket = "sachin-terraform-state"
    key    = "demo/stage/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform-lock"
  }
}
