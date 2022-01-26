#  Pulls AMI ID from AWS Region

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}





resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.large"
  vpc_security_group_ids = [aws_security_group.ec2-class-sec-group.id]
  associate_public_ip_address = true
}


resource "aws_instance" "web2" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "m5.large"
  vpc_security_group_ids = [aws_security_group.ec2-class-sec-group.id]
  associate_public_ip_address = true
}

resource "aws_instance" "class" {
  # (resource arguments)
}