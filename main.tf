provider "aws" {
  region = "eu-west-1"
  access_key = "AKIARDN5IUA7TZKN5DPH"
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
