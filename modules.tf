### 1st Concept ###                                 #### 2nd concept ####

resource "aws_instance" "myec2" {                   resource "aws_instance" "myec2" {     
   ami = "ami-082b5a644766e0e6f"                    ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"                       instance_type = var.instance_type
   
                                                    }

## instance_type = "t2.micro" --> if we will mention like this we cant override from destination end 
## instance_type = var.instance_type  --> if we use variables we can give which instance type we want 

}

variable "instance_type" {
   default = "t2.micro"
}


module "ec2module" {                               module "ec2module" {
  source = "../../modules/ec2"                     source = "../../modules/ec2"
}                                                  instance_type = "t2.large"
                                                   }
                                                   
                                                   
----> if developer want development purpose one type of instance and staging purpose one instance and testing purpose one instance 
      we can use modules and variables like above 2nd concept 
