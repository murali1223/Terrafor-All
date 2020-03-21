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

### Provisioner = By using this we have to not only created instance , 
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




 ### Here Two types of provisoners are there ###
1) Local exec 
2) remote exex

1) Local exec :- local exec provisioner allows us to invoke local executable after resources is created 
   
   example:- resources "aws_instance" "web" {
             #....
             
             provisioner "local_exec" {
                command = "echo ${aws_instance.web.private_ip} >> private_ip.txt"
                }
             }
2) remote exec:- remote exec provisioners allow to invoke scripts directly on the remote server 
   
   examples:- provisoner "remote-exec" {
               inline = [            ### inline command is used to execute multiple comands inside Ec2
                 "sudo amazon-linux-extras install -y nginx1.12",
                 "sudo systemctl start nginx"
               ]
             }
              
