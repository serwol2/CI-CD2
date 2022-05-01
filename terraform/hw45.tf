terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
 
 terraform {
  backend "s3" {
    bucket = "hw45-terraform-states"
    key    = "hw45-state"
    region = "us-east-1"
    #shared_credentials_file = "~/.aws/credentials"
  }
 }






provider "aws" {
  region = "us-east-1"
  #access_key = "AKIAT7EVD2KBERXXXXX"
  #secret_key = "rnucH1/Th8CHKIgPa4W+PCYEEZXXXXXXXXXX"

}

# resource "aws_security_group" "my-sg-hw45" {
#   name        = "my-sg-hw45"
#   description = "Traffic 80 and 22"

#   ingress {
#     description      = "22"
#     from_port        = 22
#     to_port          = 22
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

#   ingress {
#     description      = "80"
#     from_port        = 80
#     to_port          = 80
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }
 
#   ingress {
#     description      = "4000"
#     from_port        = 4000
#     to_port          = 4000
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

# }

# resource "aws_instance" "for-docker-hw45" {
#   ami           = "ami-04505e74c0741db8d"
#   instance_type = "t2.micro"
#   key_name = "mykeypairsergey"
#   security_groups = [aws_security_group.my-sg-hw45.name]
#   # user_data = "${file("inst-nginx.sh")}" 
#   tags = {
#     Name = "For-docker-hw45"
#   }

# }

# output "ec2instance" {
#   value = aws_instance.for-docker-hw45.public_ip
# }

resource "aws_secretsmanager_secret" "hw45-github-token" {
   name = "github_token"
}

resource "aws_secretsmanager_secret_version" "github_token_ver" {
  secret_id     = aws_secretsmanager_secret.hw45-github-token.id
  secret_string = "${GITH_TOKEN}"
}