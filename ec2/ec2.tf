resource "aws_instance" "practice_instance" {
    ami = data.terraform_remote_state.ami.outputs.ami
    instance_type = var.instance_type
    # VPC
    subnet_id = var.subnet
    # Security Group
    vpc_security_group_ids = var.security_group
    # the Public SSH key
    key_name = var.key
    # nginx installation
    associate_public_ip_address = true
    tags = {
    # The count.index allows you to launch a resource 
    # starting with the distinct index number 0 and corresponding to this instance.
    Name = "my-machine1"
  }
  lifecycle {
    create_before_destroy = true
  }
}

data "terraform_remote_state" "ami"{
    backend = "s3"
    config = {
        bucket = "my-tf-sr-first-bucket"
        key = "practice/jenkins-job/ami1/terraform.tfstate"
        region = "us-east-1"
    }
}
