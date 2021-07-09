terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.49.0"
    }
  }
}

provider "aws" {
  # Configuration options
  profile = "default"
  region  = "eu-central-1"
}


resource "aws_security_group" "allow_trafic" {
  name        = "${build}-sg"
  description = "Allow inbound traffic"
  

  ingress {
    description      = "SSH from VPC"
    from_port        = 0
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}


resource "aws_instance" "build_server" {
  ami           = "ami-05f7491af5eef733a"
  instance_type = "t2.micro"
  key_name = "mykeys"
  user_data = "${file("docker-install.sh")}"
  vpc_security_group_ids = [aws_security_group.allow_trafic.id]
  tags = {
    Name = "build"
  }
}
