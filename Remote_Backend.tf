Remote Backend :-

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
  }
}
