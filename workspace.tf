#### Workspace ####

Workspace:- Terraform allows to have multiple workspaces, which each of the workspaces we can have differnt set of environment
            variables associated. ( A group of windows showning in one place , that place is called workspace)


Examples : Default > t2.nano
           dev     > t2.micro                  These three are the three workspaces  
           Prod    > m4.large 
           
### Commands for workspaces ####

1) terraform workspace            --> it will show create, change and delete terraform workspaces
2) terraform workspace show       --> it will show the current workspace 
3) terraform workspace list       ---> it will show how many workspaces we have 
4) terraform workspace select dev --> it will switch to which work space we want 
5) terraform workspace new murali --> it will create new workspace and it will automatically switch to murali workspcae 

Example:-
            
   resource "aws_instance" "myweb" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "${lookup(var.instance_type, terraform.workspace)}"
   security_group = ["default"]              ### terrafrom.workspace will find which workspace its using and it will map the associated 
                                                 with the instance type and associated with the workspace ###
   
   tags {                                    ### how my module will know what is the workspace  that we are writing. its LOOKUP Command 
       Name = "wen-server"
   }
}     


variable "instance_type" {
   type = "map"

   default = "t2.nano"
   dev     = "t2.micro"
   prod    = "m4.large"
   }
}
               
               
               
               
               
               
               
               
               
               
               
