provider "aws" {
  region     = "us-west-2"
  access_key = "PUT-YOUR-ACCESS-KEY-HERE"
  secret_key = "PUT-YOUR-SECRET-KEY-HERE"
}



resource "aws_instance" "myec2" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"
}

resource "aws_eip" "lb" {
  vpc      = true
}

#### Here we are attaching elastic ip to instance ####

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.myec2.id
  allocation_id = aws_eip.lb.id
}

### Creating security group ###

resource "aws_security_group" "allow_tls" {
  name        = "kplabs-security-group"

  ingress {     ### Ingress meaning (inboud rule)
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.lb.public_ip}/32"]
#   cidr_blocks = [aws_eip.lb.public_ip/32]
  }
}
