#### Workspace ####

Workspace:- Terraform allows to have multiple workspaces, which each of the workspaces we can have differnt set of environment
            variables associated. ( A group of windows showning in one place , that place is called workspace)


Examples : Development > t2.micro
           Staging     > t2.nano                  These three are the three workspaces  
           Production  > m4.large 
           
### Commands for workspaces ####

1) terraform workspace            --> it will show create, change and delete terraform workspaces
2) terraform workspace show       --> it will show the current workspace 
3) terraform workspace list       ---> it will show how many workspaces we have 
4) terraform workspace select dev --> it will switch to which work space we want 
5) terraform workspace new murali --> it will create new workspace and it will automatically switch to murali workspcae 
