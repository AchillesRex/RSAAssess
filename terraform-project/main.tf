provider "aws" {
    region     = "us-east-1"
    access_key = "<Secret>"
    secret_key = "<Secret>"
  }

  resource "aws_instance" "example" {
    ami           = "ami-03103d9f6625af258"
    instance_type = "t2.micro"
    subnet_id     = "subnet-0552bc50de561d35e"
    tags = {
      Name = "test_instance"
    }
  }
