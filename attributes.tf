provider "aws" {
  region     = "ap-south-1"
  access_key = "PUT-YOUR-ACCESS-KEY-HERE"
  secret_key = "PUT-YOUR-SECRET-KEY-HERE"
}

resource "aws_eip" "lb" {
  vpc      = true
}

output "eip" {
  value = aws_eip.lb.public_ip
}

resource "aws_s3_bucket" "mys3" {
  bucket = "kplabs-attribute-demo-001"
}

output "mys3bucket" {
  value = aws_s3_bucket.mys3.bucket_domain_name
}



### Attributes = Attributes is notthing but we have to print the output while exection time by passing attributes. 
                 above code we are mentioning attributes in output 
