variable "aws_region" {  //currently not used since i declared it in main.tf but could be used if wanted
    default = "us-east-1"
}


variable "ec2_count" {
  default = "1"
}

variable "ami_id" {
    // Ubuntu ami found in us-east-1
    default = "ami-01cf0befd2246ed3f"
}

variable "instance_type" {
  default = "t2.micro"
}