                                        ########### Remote Backend ############ :-

1) We have to secure our code by using git 
   we can push our code into cetral repository 
   But its not a good method bcz our passwords everyone will get to know
   For this we can use ## INTERPOLATION ## in terraform  (Means we can use FILE and and pass the path of the password,
                                                          file read the content of the path)
   But the above method is protected, but its not fully safe method, our credentials will be visible in state files 
 2) For this purpose we are using ## REMOTE BACKEND ## 
 
 steps :-
 
 we have to implement s3
 
 terraform {
  backend "s3" {
    bucket = "mybucket"
    key    = "path/to/my/key"
    region = "us-east-1"
    access_key = "........" --> we have to pass only secret_key and access_key , not entire resourc block , otherwise we will get error.
    secret_key = "........" -->
  }
}

                                        ########### State Locking ###########

--> when wver we aoly terraform apply at a time 2 times its work for 2nd one, bcz its has default state locking 
--> But locking not applicable for all , it will not applicable for REMOTE BACKEND state files 
--> Remote backend s3 defaultly it wont support state locking,, but its has a feature we have implement thats 
    with the help of via DYNAMO DB LOCKING 
--> Now we go to aws console and created DYNAMO DB , and here we oassing primary key (Its ntg but LOCKID)  and create 
--> After applying terraform plan and it will provide one item in dynamodb that is called LOCKING ID
--> 
   
   terraform {
  backend "s3" {
    bucket = "mybucket"
    key    = "path/to/my/key"
    region = "us-east-1"
    acess_key = "........."
    secret_key = "........"
    dynamodb_table = "s3_state_lock"
  }
}
   
   
