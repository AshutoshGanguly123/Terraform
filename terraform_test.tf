#Main
provider "aws" {
    region = "us-east-2"
    access_key = var.access_key[0]
    secret_key = var.access_key[1]
}

#variable declaration for AWS ACcess keys
variable "access_key" {
    description = "For keeping AWS acess keys private"
}

#variable declaration for instance_type
variable "instace_type" {
  description = "For specifying the insatnce type"
}

#resoruce declaration (instance_type is static)
resource "aws_instance" "emalpha-terraform1" {
    ami = "ami-0d718c3d715cec4a7"
    instance_type = "t2.micro"
    tags = {
    Name = "emalpha-terraform"
  }
}
#resoruce declaration (instance_type is a variable defined in the terraform.tfvars file)
resource "aws_instance" "emalpha-terraform2" {
    ami = "ami-002068ed284fb165b"
    instance_type = var.instance_type[0]
    tags = {
    Name = "emalpha-terraform2"
  }
}