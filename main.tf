terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.45.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}
resource "aws_instance" "tf-ec2" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  tags = {
    "Name" = "terraform535353-${count.index}"
    
    }
  
  count = 2
 
}

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket345353-${count.index}"
  count = 2
 }

output "ec2-public" {
  value = aws_instance.tf-ec2[0].public_ip
  
}

output "aws_s3_bucket" {
  value = aws_s3_bucket.b[0].region
  
}
 