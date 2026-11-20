terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
    
}
terraform {
  backend "s3" {
    bucket = "s3-bucketttttt-jinesh"
    key    = "terraform.tfstate"
    region = "us-east-2"
  }
}
