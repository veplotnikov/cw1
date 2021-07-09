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

resource "aws_instance" "build_server" {
  ami           = "ami-05f7491af5eef733a"
  instance_type = "t2.micro"
  key_name = "mykeys"
  user_data = "${file("docker-install.sh")}"
  
  tags = {
    Name = "build"
  }
}
