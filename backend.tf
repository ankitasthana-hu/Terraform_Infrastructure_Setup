terraform {
  backend "s3" {
    bucket = "statefilebucket1x1"
    key    = "terraform.tfstate"
    region = "us-east-2"
  }
}
