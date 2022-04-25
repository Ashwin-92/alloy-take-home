//EC2 Setup
resource "aws_instance" "ash-ec2" {
    ami           = var.ami_id
    instance_type = var.instance_type
    subnet_id     = module.VPC_Module.subnet_public_id
    key_name      = "ashec2-keypair"
    vpc_security_group_ids = [ aws_security_group.ec2sg.id ]
    associate_public_ip_address = true

    tags = {
        Name = "Ash-EC2"
    }
}

resource "aws_security_group" "ec2sg" {
  name        = "EC2 Security Group"
  description = "Access in/out of the EC2 instance"
  vpc_id      = module.VPC_Module.vpc_id

  ingress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}