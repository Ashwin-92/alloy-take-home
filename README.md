# alloy-take-home
Alloy Take home assessment

This repository can be used to set up a AWS VPC, EC2 and RDS instance in the us-east-1 region.  All of this is meant to be set up on a DEV environment so it has not been secured as a production level environment.  I do have some accesskey and secret key set up during VPC creation but that key has been rotated already and is no longer in use.  I would like to add that the resources can be upgraded to a larger instance or more availabilty for the RDS but I am working with the free tier and did not want to incur costs.

The VPC module has been seperated from the creation of the EC2 and RDS instance so it can be updated or reused seperately if needed.  In the VPC module folder, in main.tf you will see that the VPC includes a few other items such as internet gateway, 3 subnets (1 public, 2 private) and others.
  
The EC2 instance is a copy of an AMI I found and it is an Ubuntu OS created on a t2.micro instance.  I enabled DNS hostnames within the VPC so the user is able to connect to the ubuntu instance using SSH.  

The RDS is set up using an open security group as well, however it is not allowed to be accessed from external entities.  I have left the SG open to all resoources in our VPC because this is set up as a dev/test environment and should not be used in prod.  

I broke up the VPC creation from the EC2/RDS creation because I was not able to pass some parameters to the EC2 and RDS if I didnt create a VPC from the module first.  Once the VPC was created and all the subnets were ready to be attached i began creation of the EC2 and RDS.  The configuration for these resources are fairly basic and definitely NOT ready for production unless some changes are made to the code.  Additionally my plan was to have only the EC2 communicate with the RDS however, that would require MySQL client to be installed on the EC2 before that can occur. 

I chose this EC2 purely because it was available and I could launch it in free tier.  Ideally I would have liked a RHEL instance but for the purpose of this test, I left it as an Ubuntu instance.  I could have chosen to use any other data store if I wanted to, however, in order to choose exactly which would be ideal, I would need to have an understanding of what it will be used for and what the company is willing to spend on this.  (Also this was the first data store that popped into my head while I was planning out the build.)
