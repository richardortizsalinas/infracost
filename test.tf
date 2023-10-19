data "aws_ami" "ubuntu" {

 most_recent = true



 filter {

   name   = "name"

   values = ["ubuntu*"]

 }

}





locals {

 instances = {

   instance1 = {

     ami           = data.aws_ami.ubuntu.id

     instance_type = "t3.medium"

   }

   instance2 = {

     ami           = data.aws_ami.ubuntu.id

     instance_type = "t3.micro"

   }

 }

}





resource "aws_instance" "this" {

 for_each      = local.instances

 ami           = each.value.ami

 instance_type = each.value.instance_type

}
