provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-02d3770deb1c746ec"
  instance_type = "t2.micro"
  subnet_id     = "subnet-02e509f9dd5834460"

  tags = {
    Name    = "poc-instance"
    #project = "devex"  # This must be 'devex' for the policy to allow creation
  }
}
