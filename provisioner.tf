resource "aws_instance" "myec2" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"
   key_name = "terraform"
   
 provisoner "remote-exec" {
   inline = [            ### inline command is used to execute multiple comands inside Ec2
       "sudo amazon-linux-extras install -y nginx1.12",
       "sudo systemctl start nginx"
       ]
   connecton {       ### its a provider connection (connection block)
     type        = "ssh"
     host        = "self.public_ip"
     user        = "ec2-user"
     private_key = "${file("./terraform.pem")}"
 
     }
   }
}   

### Provisioner = By using this we have to not aonly created instance , 
                  we have to install nginx server and run automatically by using provisioner 



resource "aws_instance" "myec2" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"
   key_name = "kplabs-terraform"

   provisioner "remote-exec" {
     inline = [
       "sudo amazon-linux-extras install -y nginx1.12",
       "sudo systemctl start nginx"
     ]

   connection {
     type = "ssh"
     user = "ec2-user"
     private_key = file("./kplabs-terraform.pem")
     host = self.public_ip
   }
   }
}
