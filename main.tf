provider "aws" {
  region     = "us-east-1"
  
  
}

#Create a new EC2 launch configuration
resource "aws_instance" "staging" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  #key_name                    = var.key_name
  security_groups             = ["${aws_security_group.ssh-security-group.id}"]
  subnet_id                   = aws_subnet.mira-public-subnet-1.id
  associate_public_ip_address = true
  #user_data                   = "${data.template_file.provision.rendered}"
  #iam_instance_profile = "${aws_iam_instance_profile.some_profile.id}"
  #Using the Key Pair wile Launching the Instance
}
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    "Name" = "staging"
  }
resource "aws_key_pair" "developer" {
  key_name   = "developer"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC0zHZqeCyz/W86cnaAhHKEuN8XuhDDFwmIq7Bw1YLfa9lCdNDVdMneg5+01hCODh7PHIE2vqdhzuX2Iu4qjzlEDPy4qK+5LCAzEInFTOYdkJfqwV255UHAUz69u9Mi+sdhIYPqYPMBkG8mNGhm3cv6XDNRYhQ9+Dj63K4hpXPzJczuzZQhAIv7/v6bGkMNmYtxzJc3mlDDSIaYqzMIcdnJwKzAgyfUU8deuMGmj3PNeF6zpnRmgyuFxNkU2X1QD+fsmmLAkaQK43NlQBLZ8JFm8guErU69NVuTgAXZUZnbjZaBm3wBe1Ay7qsu4dm4vfJem2CyuFU1qMBBEdx06QJB biskeypairawscmu"
#public_key = "${file("developer.pub")}  
 
}
#Create a new EC2 launch configuration
resource "aws_instance" "prod" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  #key_name                    = var.key_name
  security_groups             = ["${aws_security_group.webserver-security-group.id}"]
  subnet_id                   = aws_subnet.mira-private-subnet-1.id
  associate_public_ip_address = false
  #user_data                   = "${data.template_file.provision.rendered}"
  #iam_instance_profile = "${aws_iam_instance_profile.some_profile.id}"
  #Using the Key Pair wile Launching the Instance
}
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    "Name" = "prod"
  }
 
} 


