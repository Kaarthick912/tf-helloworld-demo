provider "aws" {
  region = "eu-west-1"
  access_key = "AKIARDN5IUA7ZHZBLB72"
  secret_key = "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"
}

resource "aws_instance" "web" {
  ami                    = "ami-25488752"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.web.id}"]
  user_data              = "${file("template/user_data.sh")}"
}

resource "aws_security_group" "web" {
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
