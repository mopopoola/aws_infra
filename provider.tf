terraform {
  backend "s3" {
    bucket = "mopops1-terraform-state"
    key    = "global/s3/terraform.tfstate"
    region = "eu-west-2"
    dynamodb_table = "terraform-state"
    encrypt = true
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-2"
}
