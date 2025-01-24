terraform {
  required_version = ">=1.10.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket       = "terraform-state-708626570948"
    key          = "terraform.tfstate"
    use_lockfile = true
    region = "ap-northeast-1"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_security_group" "git_test" {
  name = "git_test_sg"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
