provider "aws" {
  region     = "us-west-2"
  access_key = "PUT-YOUR-ACCESS-KEY-HERE"
  secret_key = "PUT-YOUR-SECRET-KEY-HERE"
}

resource "aws_instance" "myec2" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"
}

### Provider  = its is used to establish the which infrastruture we want 
### resources = its used to lauch the particular services in the provider 


### for download providers we are using ---< terraform init
### for checking for which resources we are installing ---> terraform plan 
### for launching terrform we are using ---> terraform apply
### for destroying infra we are using ---> terraform destroy 

### Destroying particular resources 
    ---> teraform destroy -target aws_instance.myec2    (terraform destroy -target (resource name.m=our name))

### Fetch the latest information about our current state of your insfrastructure 
   ----> terraform refresh

