provider "aws" {
  region     = "us-east-1"
  access_key = "<Secret>"
  secret_key = "<Secret>"
}

resource "aws_instance" "test_instance" {
  ami           = "ami-03103d9f6625af258"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0552bc50de561d35e"

  associate_public_ip_address = true

  vpc_security_group_ids = [
    aws_security_group.allow_http_ssh.id
  ]

  key_name = aws_key_pair.ssh_key.key_name

  tags = {
    Name = "test_instance"
  }
}

resource "aws_security_group" "allow_http_ssh" {
  name        = "allow_http_ssh"
  description = "Allow HTTP and SSH inbound traffic"
  vpc_id      = "vpc-0b9e6e8b520acd171"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_key_pair" "ssh_key" {
  key_name   = "ssh_key"
  public_key = file("/opt/key.pub")
}

resource "aws_eip" "elastic_ip" {
  instance = aws_instance.test_instance.id
  vpc      = true
}